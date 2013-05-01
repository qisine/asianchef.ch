class UserAbility
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    guest_permissions
    user_permissions if @user.persisted?
  end

  def guest_permissions
    can :read, Menu, published: true
    can :read, Chef
    can :create, Message

    with_options(user_id: @user.id) do |ability|
      ability.can :read, Message
      ability.can :manage, Booking
    end
  end

  def user_permissions
    can :manage, User, id: @user.id
  end
end
