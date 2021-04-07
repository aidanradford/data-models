/*
   Copyright 2021 Snowplow Analytics Ltd. All rights reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

{{if eq .cleanup_mode "trace"}} SELECT 1; {{else}}

  DROP TABLE IF EXISTS {{.scratch_schema}}.mobile_sv_metadata_this_run{{.entropy}};
  DROP TABLE IF EXISTS {{.scratch_schema}}.mobile_sv_run_metadata_temp{{.entropy}};

{{end}}


{{if eq .cleanup_mode "debug" "trace"}} SELECT 1; {{else}}

  DROP TABLE IF EXISTS {{.scratch_schema}}.mobile_screen_views_this_run{{.entropy}};
  DROP PROCEDURE IF EXISTS {{.output_schema}}.combine_field_versions;
  DROP PROCEDURE IF EXISTS {{.output_schema}}.concat_fields;
  DROP PROCEDURE IF EXISTS {{.output_schema}}.mobile_app_errors_fields;
  DROP PROCEDURE IF EXISTS {{.output_schema}}.mobile_mobile_context_fields;
  DROP PROCEDURE IF EXISTS {{.output_schema}}.mobile_session_context_fields;

{{end}}

{{if eq .ends_run true}}

  DROP TABLE IF EXISTS {{.scratch_schema}}.mobile_metadata_run_id{{.entropy}};

{{end}}
