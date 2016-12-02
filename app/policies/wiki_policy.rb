class WikiPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    true
  end

  def show?
    if wiki.private?
      user == wiki.user
    else
      true
    end
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    if wiki.private?
      user == wiki.user
    else
      true
    end
  end

  def edit?
    if wiki.private?
      user == wiki.user
    else
      true
    end
  end

  def destroy?
    user == wiki.user || user.is_admin?
  end
end
