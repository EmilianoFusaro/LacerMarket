class TransactionsController < ApplicationController

  def create
    content = Content.find_by!(slug: params[:slug])
    sale = content.sales.create(
      amount: (content.price*100).floor,
      email_acquirente: current_user.email,
      email_venditore: current_user,
      stripe_token: params[:stripeToken]
      )
    sale.running!

    if sale.completed?  
      redirect_to pickup_url(guid:sale.guid)
    else      
      redirect_to content_path(content), notice: @error
    end

  end

  def pickup    
      @sale= Sale.find_by!(guid:params[:guid])
      @content = @sale.content
  end


#controller riscritto più semplice e caricando il model
=begin
  def create
		content = Content.find_by!(slug: params[:slug])
		token = params[:stripeToken]

		begin
	      charge = Stripe::Charge.create(
	      :card => token,
        :amount      => (content.price * 100).floor,   #stripe legge i pagamenti in centesimi quidi devo trasformare l'importo + arrotondamento
        :description => current_user.email,
        :currency    => 'eur'
        )
        @sale  = content.sales.create!(email_acquirente: current_user.email)
        redirect_to pickup_url(guid:@sale.guid)

    rescue Stripe::CardError => e
        @error = e
        redirect_to content_path(content), notice: @error
    end
	end

	def pickup		
      @sale= Sale.find_by!(guid:params[:guid])
      @content = @sale.content
	end
=end

end