class CompaniesController < ApplicationController

  # TODO:
  def index
    #get any data in
    @companies = Company.all
    #handle business logic
    #render html file views/companies/index.html.erb
  end

  def show
    @company = Company.find_by({ "id" => params["id"] })
    @contacts = Contact.where({"company_id" => @company["id"]})
    #render html file views/companies/show.html.erb
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new
    @company["name"] = params["company"]["name"]    
    @company["city"] = params["company"]["city"]
    @company["state"] = params["company"]["state"]
    @company.save
    redirect_to "/companies"
  end

end
