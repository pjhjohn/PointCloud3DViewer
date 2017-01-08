class PointCloudsController < ApplicationController
  def index
    @point_clouds = PointCloud.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @point_clouds.map{|pointcloud| objectify(pointcloud)} }
    end
  end

  def create
    @point_cloud = PointCloud.new
    @point_cloud.name = params[:name]
    @point_cloud.data = params[:data]

    respond_to do |format|
      if @point_cloud.save
        flash[:notice] = 'PointCloud was successfully created.'
        format.html { redirect_to(@point_cloud) }
        format.json { render json: objectify(@point_cloud), status: :created, location: @point_cloud }
      else
        format.html { render action: 'new' }
        format.json { render json: @point_cloud.errors, status: :unprocessable_entity }
      end
    end
  end

  # render using three.js
  def show
    @point_cloud = PointCloud.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: objectify(@point_cloud) }
    end
  end
  
  ### Building JSON Data for download
  def objectify (point_cloud)
    {
      :id             => point_cloud.id,
      :name           => point_cloud.name,
      :data           => point_cloud.data,
      :created_at     => point_cloud.created_at,
      :updated_at     => point_cloud.updated_at,
    }
  end

  ### UNUSED ###
  def new
    redirect_to :back
  end
  
  def edit # View for edit
    redirect_to :back
  end

  def update # API for edit
    redirect_to :back
  end

  def destroy # API for remove
    redirect_to :back
  end
end
