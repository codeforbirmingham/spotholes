class PotholeStatusObserver < ActiveRecord::Observer
  observe :pothole

  def after_create(pothole)
    create_pothole_log(pothole, pothole.user_id, nil, 'create')
    # add create event log here
  end

  def after_update(pothole)
    if pothole.status_changed?
      create_pothole_log(pothole, nil, PaperTrail.whodunnit, 'update')
    end
  end

  private

  def create_pothole_log(pothole, user, admin_user, event) 
    PotholeLog.create(admin_user_id: admin_user, user_id: user, status: pothole.status, pothole_id: pothole.id)
  end
end