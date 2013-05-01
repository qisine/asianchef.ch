class chefAbility
  include CanCan::Ability

  def initialize(chef)
    if chef.persisted?
      can :manage, Chef, id: chef.id
      can :create, Message

      with_options(chef_id: chef.id) do |ability|
        ability.can :manage, Menu
        ability.can :read, Message
        ability.can :manage, Booking
      end
    end
  end
end
