class CtlcenconfiguracionesController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_configuration

  def index
    @idconfiguraciones = CtlCencontrolconfiguracion.all
    # @user = User.find_by(@idconfiguraciones.where(params[:id]))
    @user = current_user
  end
  
  def new
    @idconfiguraciones = CtlCencontrolconfiguracion.new
    @user = "#{current_user.account_number} - #{current_user.name}"
  end
  
  def create
    @idconfiguraciones = CtlCencontrolconfiguracion.create(idconfiguraciones_params)
    if @idconfiguraciones.save
      flash[:notice] = t('configuration.create')
      redirect_to ctlcenconfiguraciones_path
    else
      render :new
    end
  end
  
  def show
    @nValor1 = CtlCencontrolconfiguracion.find(params[:id])
  end

  private
    def idconfiguraciones_params
      params.require(:ctl_cencontrolconfiguracion).permit(:num_valor1,:nom_valor2,:des_descripcion, :account_number_id)
    end

#=begin
    def invalid_configuration
      redirect_to ctlcenconfiguraciones_path, notice: 'Configuración Invalida...Verifique.'
    end
#=end

end
