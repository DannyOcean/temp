class SortController < ApplicationController
  def mergesort
    data = []
    unless params[:iarray].empty? 
      data = params[:iarray].split(' ').map &:to_i
    end

    respond_with Sort.mergesort(data)
  end
end