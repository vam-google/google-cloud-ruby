# Copyright 2020 Google, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "google/cloud/talent"
require "minitest/autorun"
require "securerandom"

require_relative "../job_search_autocomplete_job_title"
require_relative "../job_search_batch_create_jobs"
require_relative "../job_search_batch_delete_job"
require_relative "../job_search_batch_update_jobs"
require_relative "../job_search_commute_search"
require_relative "../job_search_create_client_event"
require_relative "../job_search_create_company"
require_relative "../job_search_create_job"
require_relative "../job_search_create_job_custom_attributes"
require_relative "../job_search_create_tenant"
require_relative "../job_search_custom_ranking_search"
require_relative "../job_search_delete_company"
require_relative "../job_search_delete_job"
require_relative "../job_search_delete_tenant"
require_relative "../job_search_get_company"
require_relative "../job_search_get_job"
require_relative "../job_search_get_tenant"
require_relative "../job_search_histogram_search"
require_relative "../job_search_list_companies"
require_relative "../job_search_list_jobs"
require_relative "../job_search_list_tenants"

def tenant_service
  Google::Cloud::Talent.tenant_service
end

def job_service
  Google::Cloud::Talent.job_service
end

def company_service
  Google::Cloud::Talent.company_service
end

def create_tenant_helper tenant_name
  tenant = {
    name:        tenant_service.tenant_path(project: project_id, tenant: tenant_name),
    external_id: tenant_name
  }

  tenant_service.create_tenant parent: project_path, tenant: tenant
end

def create_job_helper tenant_name, company_name, job_name, requisition_id
  tenant_path = tenant_service.tenant_path project: project_id, tenant: tenant_name
  job = {
    title: job_name,
    company: company_name,
    description: "doin stuff for money",
    requisition_id: requisition_id
  }
  job_service.create_job parent: tenant_path, job: job
end

def create_company_helper tenant_name, company_name, external_id
  company = {
    display_name: company_name,
    external_id: external_id
  }
  tenant_path = tenant_service.tenant_path project: project_id, tenant: tenant_name
  company_service.create_company parent: tenant_path, company: company
end

def project_id
  ENV["GOOGLE_CLOUD_PROJECT"]
end

def project_path
  tenant_service.project_path project: project_id
end
