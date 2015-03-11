class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :delete, Board
    end

    can :read, :all
    can :create, Board

    # can :delete, Board, user_id: :id
    can :delete, Board do |board|
      board.user_id == user.id # || board.moderators.include? ...
    end

    #user.moderated_boards.each do |b|
    #  can :delete, b
    #end

    can :delete, Board do |board|
      board.moderators.include? user
    end
  end
end
