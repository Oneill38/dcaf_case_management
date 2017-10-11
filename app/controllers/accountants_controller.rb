# Controller pertaining to accountant functions, usually fulfillments.
class AccountantsController < ApplicationController
  def index
    @patients = Patient.where('fulfillment.fulfilled' => true)
    # change per to 25
    @patients = Kaminari.paginate_array(@patients).page(params[:page]).per(25)


  end

  def search
    @results = Patient.where('fulfillment.fulfilled' => true).where(:name => /#{params[:search]}/i)
    respond_to { |format| format.js }
  end
end
