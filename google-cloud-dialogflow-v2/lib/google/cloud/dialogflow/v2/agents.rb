# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "google/cloud/dialogflow/v2/version"

require "google/cloud/dialogflow/v2/agents/credentials"
require "google/cloud/dialogflow/v2/agents/paths"
require "google/cloud/dialogflow/v2/agents/operations"
require "google/cloud/dialogflow/v2/agents/client"

module Google
  module Cloud
    module Dialogflow
      module V2
        ##
        # Agents are best described as Natural Language Understanding (NLU) modules
        # that transform user requests into actionable data. You can include agents
        # in your app, product, or service to determine user intent and respond to the
        # user in a natural way.
        #
        # After you create an agent, you can add {Google::Cloud::Dialogflow::V2::Intents::Client Intents}, {Google::Cloud::Dialogflow::V2::Contexts::Client Contexts},
        # {Google::Cloud::Dialogflow::V2::EntityTypes::Client Entity Types}, {Google::Cloud::Dialogflow::V2::WebhookRequest Webhooks}, and so on to
        # manage the flow of a conversation and match user input to predefined intents
        # and actions.
        #
        # You can create an agent using both Dialogflow Standard Edition and
        # Dialogflow Enterprise Edition. For details, see
        # [Dialogflow
        # Editions](https://cloud.google.com/dialogflow/docs/editions).
        #
        # You can save your agent for backup or versioning by exporting the agent by
        # using the {Google::Cloud::Dialogflow::V2::Agents::Client#export_agent ExportAgent} method. You can import a saved
        # agent by using the {Google::Cloud::Dialogflow::V2::Agents::Client#import_agent ImportAgent} method.
        #
        # Dialogflow provides several
        # [prebuilt
        # agents](https://cloud.google.com/dialogflow/docs/agents-prebuilt)
        # for common conversation scenarios such as determining a date and time,
        # converting currency, and so on.
        #
        # For more information about agents, see the
        # [Dialogflow
        # documentation](https://cloud.google.com/dialogflow/docs/agents-overview).
        #
        # To load this service and instantiate a client:
        #
        #     require "google/cloud/dialogflow/v2/agents"
        #     client = Google::Cloud::Dialogflow::V2::Agents::Client.new
        #
        module Agents
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "agents", "helpers.rb"
require "google/cloud/dialogflow/v2/agents/helpers" if ::File.file? helper_path
