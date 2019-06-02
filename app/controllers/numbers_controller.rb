class NumbersController < ApplicationController
  before_action :authenticate_user!

  def index
    @numbers = current_user.numbers
  end

  def show
    @number = Number.find(params[:id])
  end

  def new
    @number = current_user.numbers.new
  end

  def create
    if number_params[:binary] != '' && number_params[:binary]
      decimal = number_params[:binary].to_i(2)
    end
    if number_params[:octal] != '' && number_params[:octal]
      decimal = number_params[:octal].to_i(8)
    end
    if number_params[:hexadecimal] != '' && number_params[:hexadecimal]
      decimal = number_params[:hexadecimal].to_i(16)
    end

    decimal = number_params[:decimal] if number_params[:decimal] && number_params[:decimal] != ''
    binary = decimal.to_i.to_s(2)
    octal =  decimal.to_i.to_s(8)
    hexadecimal = decimal.to_i.to_s(16).upcase

    @number = current_user.numbers.new(user_id: number_params[:user_id], decimal: decimal, binary: binary, octal: octal, hexadecimal: hexadecimal)
    if @number.save
      flash[:notice] = "Number was successfully created"
      redirect_to number_path(@number)
    else
      @number.errors.map { |key, value| flash[:alert] = "#{key} #{value}" }
      render 'new'
    end
  end

  def number_params
    params.require(:number).permit(:decimal, :binary, :octal, :hexadecimal, :user_id)
  end
end
