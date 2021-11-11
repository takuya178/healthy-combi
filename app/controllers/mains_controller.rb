class MainsController < ApplicationController
  def index
    @q = Main.ransack(params[:q])
    @mains = @q.result(distinct: true).all.page(params[:page])
  end

  def show
    @main = Main.find(params[:id])
  end

  def new
    @main = Main.new
    @main.subs.build

    @mains = Main.find_by(name: params[:name])
  end

  def create
    @main = Main.new(main_params)
    main_data = Main.find_or_initialize_by(name: main_params[:name])

    if main_data.new_record?
      if @main.save
        redirect_to new_main_path, success: '組み合わせを追加しました'
      else
        flash.now[:danger] = '組み合わせの追加に失敗しました'
        render :new
      end
    else
      main_data.subs << Sub.create(name: main_params[:subs_attributes]['0'][:name], calorie: main_params[:subs_attributes]['0'][:calorie], sugar: main_params[:subs_attributes]['0'][:sugar], lipid: main_params[:subs_attributes]['0'][:lipid], salt: main_params[:subs_attributes]['0'][:salt], stores: main_params[:subs_attributes]['0'][:stores])

      redirect_to new_main_path, success: "#{main_data.name}に新しい組み合わせを追加しました"
    end
  end

  private

  def main_params
    params.require(:main).permit(:name, :image, :calorie, :sugar, :lipid, :salt, :genre, :stores, subs_attributes:[:name, :image, :calorie, :sugar, :lipid, :salt, :stores, :id])
  end

end
