class LinkController < ApplicationController

  def shortlink
    @originallink = params[:link][:originallink]
    url_user = Link.check_http(@originallink)
    randomKey = [*('A'..'Z'),*('a'..'z')].shuffle[0,3].join
    link = Link.create(originallink: url_user, shortlink: randomKey)
    link.save
    redirect_to "/#{link.shortlink}"
  end

  def show
    link = Link.where(shortlink: params[:shortlink])
    redirect_to "#{link.first.originallink}"
  end

end
