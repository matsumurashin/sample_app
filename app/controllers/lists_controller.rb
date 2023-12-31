class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create
    # 1.& 2. データを受け取り新規登録するためのインスタンス作成
   # list = List.new(list_params)
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
   # list.save
    list.save
    # 4. トップ画面へ、リダイレクト
   #  redirect_to '/top'
   redirect_to list_path(list.id)
  end

  def destriy
    list = List.find(params[:id]) #データ（レコード）を１件取得
    list.destroy  #データ（レコード）を削除
    redirect_to '/list' #投稿一覧画面へリダイレクト
  end

  def index
     @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
     @list = List.find(params[:id])
  end

  def update
      list = List.find(params[:id])
      list.update(list_params)
      redirect_to list_path(list.id)
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
