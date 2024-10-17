class ProjectPolicy < ApplicationPolicy
  def show?
    record.user_ids.include? user.id
  end

  def update?
    record.owner == user
  end

  def destroy?
    record.owner == user
  end
end
