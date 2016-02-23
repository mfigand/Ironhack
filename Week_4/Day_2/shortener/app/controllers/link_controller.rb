class LinkController < ApplicationController

  def shortlink
    @originallink = params[:link][:originallink]
    link = Link.create(originallink: @originallink, shortlink: "345")
    link.save
    redirect_to "/#{link.shortlink}"
  end

  def show
    link = Link.where(shortlink: params[:shortlink])
    redirect_to "#{link.first.originallink}"
  end

end
