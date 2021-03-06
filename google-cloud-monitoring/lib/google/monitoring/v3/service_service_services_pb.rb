# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/monitoring/v3/service_service.proto for package 'Google::Cloud::Monitoring::V3'
# Original file comments:
# Copyright 2020 Google LLC
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
#


require 'grpc'
require 'google/monitoring/v3/service_service_pb'

module Google
  module Monitoring
  end
end
module Google::Monitoring::V3
  module ServiceMonitoringService
    # The Cloud Monitoring Service-Oriented Monitoring API has endpoints for
    # managing and querying aspects of a workspace's services. These include the
    # `Service`'s monitored resources, its Service-Level Objectives, and a taxonomy
    # of categorized Health Metrics.
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'google.monitoring.v3.ServiceMonitoringService'

      # Create a `Service`.
      rpc :CreateService, CreateServiceRequest, Google::Monitoring::V3::Service
      # Get the named `Service`.
      rpc :GetService, GetServiceRequest, Google::Monitoring::V3::Service
      # List `Service`s for this workspace.
      rpc :ListServices, ListServicesRequest, ListServicesResponse
      # Update this `Service`.
      rpc :UpdateService, UpdateServiceRequest, Google::Monitoring::V3::Service
      # Soft delete this `Service`.
      rpc :DeleteService, DeleteServiceRequest, Google::Protobuf::Empty
      # Create a `ServiceLevelObjective` for the given `Service`.
      rpc :CreateServiceLevelObjective, CreateServiceLevelObjectiveRequest, Google::Monitoring::V3::ServiceLevelObjective
      # Get a `ServiceLevelObjective` by name.
      rpc :GetServiceLevelObjective, GetServiceLevelObjectiveRequest, Google::Monitoring::V3::ServiceLevelObjective
      # List the `ServiceLevelObjective`s for the given `Service`.
      rpc :ListServiceLevelObjectives, ListServiceLevelObjectivesRequest, ListServiceLevelObjectivesResponse
      # Update the given `ServiceLevelObjective`.
      rpc :UpdateServiceLevelObjective, UpdateServiceLevelObjectiveRequest, Google::Monitoring::V3::ServiceLevelObjective
      # Delete the given `ServiceLevelObjective`.
      rpc :DeleteServiceLevelObjective, DeleteServiceLevelObjectiveRequest, Google::Protobuf::Empty
    end

    Stub = Service.rpc_stub_class
  end
end
