class FiresController < ApplicationController
  before_action :authorize_request, except: %i[create fire]
  before_action :find_fire_prevention_cert, except: %i[create fire]

  def create
    @cert = Fire.new(fire_prevention_params)
    if @cert.save
      render json: { status: '200', message: 'Fire prevention certificate created successfully', data: @cert },
             status: :created
    else
      render json: { status: '500', message: 'Bad request', error: @cert.errors.full_messages },
             status: :unprocessable_entity
    end

  end

  def fire
    @cert = Fire.find_by_business_id(params[:business_id])
    if @cert
      render json: { status: '200', message: 'Cert found', data: @cert }, status: :ok
    else
      render json: { status: '400', message: 'Cert not found', data: @cert }, status: :unprocessable_entity
    end
  end
  # GET /cert/{id}
  def show
    render json: { status: '200', message: 'Certs found', data: @cert }, status: :ok
  end

  private
  def find_fire_prevention_cert
    @cert = Fire.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Cert not found' }, status: :not_found
  end

  def fire_prevention_params
    params.require(:fire)
          .permit(:business_name, :business_id, :plot_number, :street, :regitration_number, :vehicle_type,
                  :inpection_date, :certification_date, :phone, :email, :sub_county, :ward)
  end
end
