class SessionsController < ApplicationController
  def new
    @erro = nil
  end

  def create
    usuario = Usuario.find_by(login: params[:session][:login])
    if usuario && usuario.senha == params[:session][:senha]
      session[:user_id] = usuario.id
      # Define a expiração para a sessão específica
      request.session_options[:expire_after] = 24.hours
      redirect_to termos_path, notice: 'Logged in!'
    else
      if usuario.blank?
        @erro = "Usuario não encontrado"
      elsif (usuario.senha != params[:session][:senha])
        @erro = "Senha invalida!"
      end
      render :new
    end
  end
  

  def logout
    session[:user_id] = nil
    render :new
  end
end
