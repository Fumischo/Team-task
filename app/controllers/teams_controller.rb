class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i[show edit update destroy]
<<<<<<< HEAD
  before_action :owner_authority, only: [:edit, :change_owner]
=======
  before_action :owner_authority, only: [:edit]
>>>>>>> cb31475be11af44ef05c834be13fbe04c5155d84

  def index
    @teams = Team.all
  end

  def show
    @working_team = @team
    change_keep_team(current_user, @team)
  end

  def new
    @team = Team.new
  end



  # def edit
  #   if @team.owner_id != current_user.id
  #     redirect_to team_path, notice: "権限がありません"
  #   end 
  # end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.save
      @team.invite_member(@team.owner)
      redirect_to @team, notice: I18n.t('views.messages.create_team')
    else
      flash.now[:error] = I18n.t('views.messages.failed_to_save_team')
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: I18n.t('views.messages.update_team')
    else
      flash.now[:error] = I18n.t('views.messages.failed_to_save_team')
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: I18n.t('views.messages.delete_team')
  end

  def dashboard
    @team = current_user.keep_team_id ? Team.find(current_user.keep_team_id) : current_user.teams.first
  end

<<<<<<< HEAD
  def change_owner
    @team = Team.find_by(name: params[:team_id])
    @user = User.find_by(id: params[:id])
    @team.update(owner_id: params[:id])
    redirect_to team_url(params[:team_id]), notice: '権限を譲渡しました'
    ContactMailer.contact_mail(@user.email, @team).deliver
  end

=======
>>>>>>> cb31475be11af44ef05c834be13fbe04c5155d84

  private

  def set_team
    @team = Team.friendly.find(params[:id])
  end

  def team_params
    params.fetch(:team, {}).permit %i[name icon icon_cache owner_id keep_team_id]
  end

  def owner_authority
<<<<<<< HEAD
    @team = Team.find_by(name: params[:team_id])
    if @team.owner == current_user
=======
    if @team.owner_id == current_user.id
>>>>>>> cb31475be11af44ef05c834be13fbe04c5155d84
    else
      redirect_to @team, notice: "権限がありません。"
    end
  end
end
