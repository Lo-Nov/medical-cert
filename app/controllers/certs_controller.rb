class CertsController < ApplicationController
  before_action :authorize_request, except: %i[create printcert index show]
  before_action :find_cert, except: %i[create index printcert]
  # only: [:show, :update, :destroy]


  # GET /certs
  def index
    @certs = Cert.all
    render json: { status: '200', message: 'Certs found', data: @certs }, status: :ok
  end

  #   print cert

  def printcert
    @cert = Cert.find_by_id_number(params[:id_number])
    render json: { status: '200', message: 'Certs found', data: @cert }, status: :ok

  end

  # GET /cert/{id}
  def show
    render json: { status: '200', messagge: 'Certs found', data: @cert }, status: :ok
  end

  # POST /cert
  def create
    @cert = Cert.new(cert_params)
    if @cert.save
      render json: { status: :created, message: 'Cert created successfully', data: @cert }, status: :created
    else
      render json: { errors: @cert.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /cert/{id}
  def update
    unless @cert.update(cert_params)
      render json: { errors: @cert.errors.full_messages },
             status: :unprocessable_entity
    end
 end

  # DELETE /cert/{username}
  def destroy
    @cert.destroy
  end

  private
  def find_cert
    @cert = Cert.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Cert not found' }, status: :not_found
  end

  def pcert
    @cert = Cert.find_by_id_number(params[:id_number])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'No cert found' }, status: :not_found
   end

  def cert_params
    params.permit(
      :full_name, :id_number, :company_name, :business_id, :examined_at, :lab_ref_number, :expiry_date
    )
    end
end
