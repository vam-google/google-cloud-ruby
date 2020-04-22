require_relative "helper"

describe "Job Search Samples" do
  parallelize_me!

  let(:prefix) { "talent_samples_" }
  let(:tenant) { create_tenant_helper "#{prefix}tenant_#{SecureRandom.hex}" }
  let(:tenant_name) { tenant.name.split("/").last }
  let(:external_id) { SecureRandom.hex }
  let :company do
    create_company_helper tenant_name, "#{prefix}company_#{SecureRandom.hex}", external_id
  end
  let(:company_name) { company.name.split("/").last }
  
  let :job do
    job_name = "#{prefix}job_#{SecureRandom.hex}"
    create_job_helper tenant_name, company_name, job_name, external_id
  end
  let(:job_name) { job.name.split("/").last }
  
  describe "job_search_autocomplete_job_title" do
    it "puts completion suggestions for job and company titles" do
      # company
      job
      # require "pry"
      # binding.pry

      # complete_query project_id: project_id,
      # tenant_id:, query:, page_size:, language_code:
    end
  end

  describe "job_search_batch_create_jobs" do
  end

  describe "job_search_batch_delete_job" do
  end

  describe "job_search_batch_update_jobs" do
  end

  describe "job_search_commute_search" do
  end

  describe "job_search_create_client_event" do
  end

  describe "job_search_create_company" do
  end

  describe "job_search_create_job" do
  end

  describe "job_search_create_job_custom_attributes" do
  end

  describe "job_search_create_tenant" do
  end

  describe "job_search_custom_ranking_search" do
  end

  describe "job_search_delete_company" do
  end

  describe "job_search_delete_job" do
  end

  describe "job_search_delete_tenant" do
  end

  describe "job_search_get_company" do
  end

  describe "job_search_get_job" do
  end

  describe "job_search_get_tenant" do
  end

  describe "job_search_histogram_search" do
  end

  describe "job_search_list_companies" do
  end

  describe "job_search_list_jobs" do
  end

  describe "job_search_list_tenants" do
  end
end
