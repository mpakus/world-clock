# frozen_string_literal: true

class ClocksController < ApplicationController
  def index
    render_space_timezones
  end

  def new
    render inertia: 'Clocks/New',
           props: {
             timezones: timezones_prepared,
             errors: {}
           }
  end

  def create
    if timezone_code_param.blank?
      return render inertia: 'Clocks/New',
                    props: {
                      timezones: timezones_prepared,
                      errors: { timezone: 'Select Timezone' }
                    }
    end
    space.locations.create(time_params)
    redirect_to clock_path(id: space.token)
  end

  def show
    render_space_timezones
  end

  def destroy
    space.locations.where(timezone: Timezone.find(params[:id])).destroy_all
    redirect_to clock_path(id: space.token)
  end

  private

  def timezones_prepared
    @timezones_prepared ||= timezones.map { |tz| { code: tz.id, label: "UTC#{tz.utc}: #{tz.names.join(', ')}" } }
  end

  def timezones
    @timezones ||= Timezone.order(utc: :asc)
  end

  # @return [Space]
  def space
    return @space if defined? @space

    token = cookies[:space] || params[:id]

    if token.present?
      @space = Space.find_by(token: token)
      return @space if @space.present?
    end

    @space = Space.create!(token: SecureRandom.hex(16))
    cookies.permanent[:space] = @space.token
    @space
  end

  def space_timezones
    @space_timezones ||= space.timezones.order(timezones: { utc: :asc }).as_json(only: %i[id tz utc names])
  end

  def render_space_timezones
    render inertia: 'Clocks/Index',
           props: {
             timezones: space_timezones
           }
  end

  def time_params
    {
      timezone: Timezone.find(timezone_code_param)
    }
  end

  def timezone_code_param
    @timezone_code_param ||= params.dig('timezone', 'code')&.to_i
  end
end
