class SortController < ApplicationController
  def mergesort
    data = []
    unless params[:iarray].empty? 
      data = params[:iarray].split(' ').map &:to_i
    end
    sort = Sort.new
    result = sort.long_mergesort(data)
    response = sort.response
    response[:result] = result

    respond_with response
    # respond_with Sort.mergesort(data)
  end
end