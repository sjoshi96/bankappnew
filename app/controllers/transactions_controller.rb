# frozen_string_literal: true

class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @transaction = Transaction.new
    respond_to do |format|
      format.json { render json: { transaction: @transaction }, status: :ok }
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      format.json { render json: { transaction: @transaction }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.json { render json: { transaction: @transaction }, status: :created }
      else
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      @transaction.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def index
    @transaction = Transaction.all
    respond_to do |format|
      format.json { render json: { transaction: @transaction }, status: :ok }
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      format.json { render json: { transaction: @transaction }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      if @transaction.update(bank_params)
        format.json { render json: { transaction: @transaction }, status: :ok }
      else
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:txn_type, :txn_mode, :amount)
end
end
