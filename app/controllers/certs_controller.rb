class CertsController < ApplicationController
  before_action :authorize_request, except: %i[create printcert index show income_type]
  before_action :find_cert, except: %i[create index printcert income_type]
  # only: [:show, :update, :destroy]
  require 'rest-client'


  # GET /certs
  def index
    @certs = Cert.all
    render json: { status: '200', message: 'Certs found', data: @certs }, status: :ok
  end

  #   print cert

  def printcert
    @cert = Cert.find_by_id_number(params[:id_number])
    if @cert
    render json: { status: '200', message: 'Certs found', data: @cert }, status: :ok
    else
      render json: { status: '400', message: 'Cert not found', data: @cert }, status: :unprocessable_entity
    end

  # GET /cert/{id}
  def show
    render json: { status: '200', message: 'Certs found', data: @cert }, status: :ok
  end

  # call external api

  def income_type
    url = 'https://biller.revenuesure.co.ke/demographics/api/'
    body = RestClient.get(url, { params: {
                            'function' => 'getWards',
                            'subCountyCode' => '33179'
                          } })
    #
    # body2 = RestClient.post(url, {
    #                           'function' => 'getWards',
    #                           'subCountyCode' => '33179'
    #                         })

    # body3 = RestClient.post(url, {'function' => 'getWards','subCountyCode' => '33179' })



    render json: body
  end

  # POST /cert
  def create
    @cert = Cert.new(cert_params)
    if @cert.save
      render json: { status: '200', message: 'Cert created successfully', data: @cert },
             status: :created
    else
      render json: { status: '500', message: 'check lab_ref_number should be unique' },
             status: :unprocessable_entity
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
    params.require(:cert)
          .permit(:full_name, :id_number, :company_name, :business_id, :examined_at, :lab_ref_number, :expiry_date,
                  :sub_county, :ward)
  end
end
