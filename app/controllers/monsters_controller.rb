class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
  end

  
  def create
    @monster = Monster.new(monster_params)
    if @monster.save
        redirect_to @monster, notice: "Se ha creado el monstruo correctamente"
    else
        render :new
    end
  end

  def edit
      @monster = Monster.find(params[:id])
  end

  def update
    @monster = Monster.find(params[:id])
    if @monster.update(monster_params_require)
      redirect_to @monster, notice: "Se ha modificado el monstruo correctamente"
    else
      render :edit
    end
  end
  
  private
  def monster_params
    params.permit(:name, :description, :phone, :birthdate, :image) #Preguntar el por que funciona con require
  end

  def monster_params_require
    params.require(:monster).permit(:name, :description, :phone, :birthdate, :image)
  end

end 

