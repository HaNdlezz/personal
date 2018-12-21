class PeopleController < ApplicationController


	def index
		@personas = Person.all
		Holidays.load_custom('jolijoli.yaml')
		date = Date.civil(2013,8,12)
		date_custom = Holidays.on(date, :custom)
		Rails.logger.info date_custom
	end

	def new
		@person = Person.new
	end
	ssasa
	def create
		person = Person.new
		person.name = params[:person][:name]
		person.dni = params[:person][:dni]
		person.save
		Rails.logger.info params[:person][:name]
		puts params[:person][:dni]
		people = Person.all
		puts people.class
		respond_to do |format|
	      if person.save
	        format.html { redirect_to people_path, notice: 'Book was successfully created.' }
	        format.json { render :show, status: :created, location: people }
	      else
	        format.html { render :new }
	        format.json { render json: people.errors, status: :unprocessable_entity }
	      end
	    end
	end
	Master
	def show
	end

	def edit
		Rails.logger.info params
		puts "CONTEEENT"
		@person = Person.find(params[:id])
	end

	def update
		respond_to do |format|
			Rails.logger.info params
			puts "PARAMS ARRIBA"
			act = Person.find(params[:id])
			actualizador = {"name": params[:person][:name], "dni": params[:person][:dni]}
			act.update(actualizador)
			#act.name = params[:person][:name]
			#act.dni = params[:person][:dni]
			#act.save
	        format.html { redirect_to people_path, notice: 'Book was successfully updated.' }
	        format.json { render :show, status: :ok, location: people }
	    end
	end

	def destroy
	    dest = Person.find(params[:id])
	    dest.destroy
	    respond_to do |format|
			format.html { redirect_to people_path, notice: 'Book was successfully destroyed.' }
			format.json { head :no_content }
	    end
	end
end