module EventsHelper
  def creator(id)
    User.find(id)
  end
end
