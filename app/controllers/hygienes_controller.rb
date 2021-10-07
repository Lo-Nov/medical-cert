class HygienesController < ApplicationController
  before_action :authorize_request, except: %i[create hygiene]
  before_action :find_food_hygiene_cert, except: %i[create hygiene]

  def create
    @cert = Hygiene.new(food_hygiene_certificate_params)
    if @cert.save
      render json: { status: '200', message: 'Food hygiene certificate created successfully', data: @cert },
             status: :created
    else
      render json: { status: '500', message: 'Bad request', error: @cert.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def hygiene
    @cert = Hygiene.find_by_business_id(params[:business_id])
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
  def find_food_hygiene_cert
    @cert = Hygiene.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Cert not found' }, status: :not_found
  end

  # def print_food_hygiene_cert
  #   @cert = Hygiene.find_by_business_id(params[:business_id])
  # rescue ActiveRecord::RecordNotFound
  #   render json: { errors: 'No cert found' }, status: :not_found
  # end
  #
  def food_hygiene_certificate_params
    params.require(:hygiene)
          .permit(:full_name, :plot_number, :lr_number, :business_id, :receipt_number, :amount, :physical_address, :nuture_of_business, :expiry_date,
                  :sub_county, :ward)
  end
end
