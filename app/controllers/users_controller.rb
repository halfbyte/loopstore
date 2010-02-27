class UsersController < Clearance::UsersController

  skip_before_filter :set_iphone_view, :only => :show

  def show
    @user = User.find(params[:id])
    logger.debug "YAYYY"

    respond_to do |f|
      f.vcf do
        logger.debug "De Buggin"
        card = Vpim::Vcard::Maker.make2 do |maker|
          maker.add_name do |name|
            name.given = 'Nano'
            name.family = 'Loopstore'
          end

          maker.add_email(maildrop(@user, true)) { |e| e.location = 'private' }
          maker.add_email(maildrop(@user, false)) { |e| e.location = 'public' }
        end
        logger.debug card.to_s
        render :text => card.to_s, :type => 'text/x-vcard'
      end
      f.html
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Saved your settings..."
      redirect_to root_path
    else
      render 'edit'
    end

  end

  def index
    @users = User.all
  end
end