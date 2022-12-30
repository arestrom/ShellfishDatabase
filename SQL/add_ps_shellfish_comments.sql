
-- Create comments to tables and columns
-- Created 2022-10-26

-- survey
COMMENT ON TABLE public.survey IS 'Top level header information for surveys';
COMMENT ON COLUMN survey.survey_id IS 'Universally unique primary key';
COMMENT ON COLUMN survey.survey_type_id IS 'The type of survey conducted (aerial, creel, etc.)';
COMMENT ON COLUMN survey.sampling_program_id IS 'The organizational unit that conducted the survey';
COMMENT ON COLUMN survey.beach_id IS 'Link to the beach table, describes characteristics of the beach';
COMMENT ON COLUMN survey.point_location_id IS 'Link to the point_location table, describes a specific point';
COMMENT ON COLUMN survey.area_surveyed_id IS 'Was entire beach surveyed (all, portion, etc.)';
COMMENT ON COLUMN survey.data_review_status_id IS 'Status of data review (final, preliminary, etc.)';
COMMENT ON COLUMN survey.survey_completion_status_id IS 'Was survey completed (partial, completed, etc.)';
COMMENT ON COLUMN survey.survey_datetime IS 'Date of the survey';
COMMENT ON COLUMN survey.start_datetime IS 'Time of day when survey started';
COMMENT ON COLUMN survey.end_datetime IS 'Time of day when survey ended';
COMMENT ON COLUMN survey.comment_text IS 'Comments on survey';

-- survey_type_lut
COMMENT ON TABLE public.survey_type_lut IS 'The type of survey conducted (aerial, creel, etc.)';
COMMENT ON COLUMN survey_type_lut.survey_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN survey_type_lut.survey_type_code IS 'Short code for survey type';
COMMENT ON COLUMN survey_type_lut.survey_type_description IS 'Description of survey type';

-- sampling_program_lut
COMMENT ON TABLE public.sampling_program_lut IS 'The organizational unit that conducted the survey';
COMMENT ON COLUMN sampling_program_lut.sampling_program_id IS 'Universally unique primary key';
COMMENT ON COLUMN sampling_program_lut.agency_id IS 'Link to table listing external agencies. Not currently used';
COMMENT ON COLUMN sampling_program_lut.sampling_program_code IS 'Short code for unit';
COMMENT ON COLUMN sampling_program_lut.sampling_program_name IS 'Full name of organizational unit';

-- beach
COMMENT ON TABLE public.beach IS 'Tide corrections and descriptive information for specific beaches';
COMMENT ON COLUMN beach.beach_id IS 'Universally unique primary key';
COMMENT ON COLUMN beach.tide_station_location_id IS 'Link to the point_location table';
COMMENT ON COLUMN beach.local_beach_name IS 'Commonly used name for the beach. May differ from official name';
COMMENT ON COLUMN beach.beach_description IS 'Descriptive information for the beach';
COMMENT ON COLUMN beach.low_tide_correction_minutes IS 'Low tide correction factor in minutes';
COMMENT ON COLUMN beach.low_tide_correction_feet IS 'Low tide correction factor in feet';
COMMENT ON COLUMN beach.high_tide_correction_minutes IS 'High tide correction factor in minutes';
COMMENT ON COLUMN beach.high_tide_correction_feet IS 'High tide correction factor in feet';

-- point_location
COMMENT ON TABLE public.point_location IS 'Data associated with point locations';
COMMENT ON COLUMN point_location.point_location_id IS 'Universally unique primary key';
COMMENT ON COLUMN point_location.location_type_id IS 'Type of location (harvester count location, tide station, etc.)';
COMMENT ON COLUMN point_location.beach_id IS 'Link to the beach table, describes characteristics of the beach';
COMMENT ON COLUMN point_location.location_code IS 'Short code to identify point';
COMMENT ON COLUMN point_location.location_name IS 'Name of point (place name, etc.)';
COMMENT ON COLUMN point_location.location_description IS 'Extended description of point';
COMMENT ON COLUMN point_location.horizontal_accuracy IS 'Estimated accuracy of the point in meters';
COMMENT ON COLUMN point_location.comment_text IS 'Additional comments regarding point location coordinates';
COMMENT ON COLUMN point_location.gid IS 'Unique integer ID required to manually edit geometry';
COMMENT ON COLUMN point_location.geom IS 'Coordinates stored in binary format. EPSG:2927';

-- location_type_lut
COMMENT ON TABLE public.location_type_lut IS 'Type of location (harvester count location, tide station, etc.)';
COMMENT ON COLUMN location_type_lut.location_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN location_type_lut.location_type_description IS 'Description of location type';

-- area_surveyed_lut
COMMENT ON TABLE public.area_surveyed_lut IS 'Description of the extent of a site that was surveyed';
COMMENT ON COLUMN area_surveyed_lut.area_surveyed_id IS 'Universally unique primary key';
COMMENT ON COLUMN area_surveyed_lut.area_surveyed_description IS 'Description of area categories (entire beach, most of beach, etc.)';

-- data_review_status_lut
COMMENT ON TABLE public.data_review_status_lut IS 'Status of data review process';
COMMENT ON COLUMN data_review_status_lut.data_review_status_id IS 'Universally unique primary key';
COMMENT ON COLUMN data_review_status_lut.data_review_status_description IS 'Description of review categories (Preliminary, Final, etc.)';

-- survey_completion_status_lut
COMMENT ON TABLE public.survey_completion_status_lut IS 'Was the survey completed?';
COMMENT ON COLUMN survey_completion_status_lut.survey_completion_status_id IS 'Universally unique primary key';
COMMENT ON COLUMN survey_completion_status_lut.completion_status_description IS 'Description of status categories';

-- beach_boundary_history
COMMENT ON TABLE public.beach_boundary_history IS 'Effort estimation polygons, names, and assorted data for beaches';
COMMENT ON COLUMN beach_boundary_history.beach_boundary_history_id IS 'Universally unique primary key';
COMMENT ON COLUMN beach_boundary_history.beach_id IS 'Link to beach table';
COMMENT ON COLUMN beach_boundary_history.survey_type_id IS 'The type of survey conducted (Clam aerial, Clam ground, etc.)';
COMMENT ON COLUMN beach_boundary_history.beach_number IS 'Beach Identification number (BIDN)';
COMMENT ON COLUMN beach_boundary_history.beach_name IS 'Name of the beach';
COMMENT ON COLUMN beach_boundary_history.active_indicator IS 'Boolean indicating if boundary is currently active';
COMMENT ON COLUMN beach_boundary_history.active_datetime IS 'Date when boundary was activated';
COMMENT ON COLUMN beach_boundary_history.inactive_datetime IS 'Date when boundary was inactivated';
COMMENT ON COLUMN beach_boundary_history.inactive_reason IS 'Reason boundary was inactivated';
COMMENT ON COLUMN beach_boundary_history.gid IS 'Unique integer ID required to manually edit geometry';
COMMENT ON COLUMN beach_boundary_history.geom IS 'Polygons of beaches stored in binary format, EPSG:2927';

-- management_region_lut
COMMENT ON TABLE public.management_region_lut IS 'Polygons for shellfish management regions in Puget Sound';
COMMENT ON COLUMN management_region_lut.management_region_id IS 'Universally unique primary key';
COMMENT ON COLUMN management_region_lut.management_region_code IS 'Numeric codes for the management regions';
COMMENT ON COLUMN management_region_lut.management_region_description IS 'Descriptions of the management regions';
COMMENT ON COLUMN management_region_lut.gid IS 'Unique integer ID required to manually edit geometry';
COMMENT ON COLUMN management_region_lut.geom IS 'Polygons of management regions stored in binary format, EPSG:2927';

-- shellfish_management_area_lut
COMMENT ON TABLE public.shellfish_management_area_lut IS 'Polygons for shellfish management areas in Puget Sound';
COMMENT ON COLUMN shellfish_management_area_lut.shellfish_management_area_id IS 'Universally unique primary key';
COMMENT ON COLUMN shellfish_management_area_lut.shellfish_area_code IS 'Numeric codes for the management areas';
COMMENT ON COLUMN shellfish_management_area_lut.shellfish_area_description IS 'Descriptions of the management areas';
COMMENT ON COLUMN shellfish_management_area_lut.gid IS 'Unique integer ID required to manually edit geometry';
COMMENT ON COLUMN shellfish_management_area_lut.geom IS 'Polygons of management areas stored in binary format, EPSG:2927';

-- beach_intertidal_area
COMMENT ON TABLE public.beach_intertidal_area IS 'Polygons for the intertidal areas. Intended for mapping population data';
COMMENT ON COLUMN beach_intertidal_area.beach_intertidal_area_id IS 'Universally unique primary key';
COMMENT ON COLUMN beach_intertidal_area.beach_id IS 'Link to the beach table';
COMMENT ON COLUMN beach_intertidal_area.gid IS 'Unique integer ID required to manually edit geometry';
COMMENT ON COLUMN beach_intertidal_area.geom IS 'Polygons of management regions stored in binary format, EPSG:2927';

-- survey_mobile_device
COMMENT ON TABLE public.survey_mobile_device IS 'Associative table between survey table and mobile_device table';
COMMENT ON COLUMN survey_mobile_device.survey_mobile_device_id IS 'Universally unique primary key';
COMMENT ON COLUMN survey_mobile_device.survey_id IS 'Link to survey table';
COMMENT ON COLUMN survey_mobile_device.mobile_device_id IS 'Link to mobile_device table';

-- mobile_device
COMMENT ON TABLE public.mobile_device IS 'Stores data for tracking mobile devices';
COMMENT ON COLUMN mobile_device.mobile_device_id IS 'Universally unique primary key';
COMMENT ON COLUMN mobile_device.mobile_device_type_id IS 'Type of device (Pad, GPS, etc.)';
COMMENT ON COLUMN mobile_device.mobile_equipment_identifier IS 'Typically the MEID number printed on device';
COMMENT ON COLUMN mobile_device.mobile_device_name IS 'Name of device';
COMMENT ON COLUMN mobile_device.mobile_device_description IS 'Description of device';
COMMENT ON COLUMN mobile_device.active_indicator IS 'Is the device still active and being used?';
COMMENT ON COLUMN mobile_device.inactive_datetime IS 'Date the device was taken out of service';

-- mobile_device_type_lut
COMMENT ON TABLE public.mobile_device_type_lut IS 'Type of mobile device';
COMMENT ON COLUMN mobile_device_type_lut.mobile_device_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN mobile_device_type_lut.mobile_device_type_description IS 'Type of device (Pad, GPS, etc.)';

-- mobile_survey_form
COMMENT ON TABLE public.mobile_survey_form IS 'Table for tracking source of data collected with mobile device';
COMMENT ON COLUMN mobile_survey_form.mobile_survey_form_id IS 'Universally unique primary key';
COMMENT ON COLUMN mobile_survey_form.survey_id IS 'Link to survey table';
COMMENT ON COLUMN mobile_survey_form.parent_form_survey_id IS 'Unique ID (integer) generated in parent form';
COMMENT ON COLUMN mobile_survey_form.parent_form_survey_guid IS 'GUID generated in parent form';
COMMENT ON COLUMN mobile_survey_form.parent_form_name IS 'Name of the parent form used to record data';
COMMENT ON COLUMN mobile_survey_form.parent_form_id IS 'Integer ID of the parent form used to record data';

-- survey_sampler
COMMENT ON TABLE public.survey_sampler IS 'Associative table between survey and sampler tables';
COMMENT ON COLUMN survey_sampler.survey_sampler_id IS 'Universally unique primary key';
COMMENT ON COLUMN survey_sampler.survey_id IS 'Link to survey table';
COMMENT ON COLUMN survey_sampler.sampler_id IS 'Link to sampler table';

-- sampler
COMMENT ON TABLE public.sampler IS 'Base information for samplers';
COMMENT ON COLUMN sampler.sampler_id IS 'Universally unique primary key';
COMMENT ON COLUMN sampler.first_name IS 'First name of sampler';
COMMENT ON COLUMN sampler.last_name IS 'Last name of sampler';
COMMENT ON COLUMN sampler.active_indicator IS 'Flag to indicate if sampler is still employed';

-- survey_event
COMMENT ON TABLE public.survey_event IS 'Data for events occurring during a survey';
COMMENT ON COLUMN survey_event.survey_event_id IS 'Universally unique primary key';
COMMENT ON COLUMN survey_event.survey_id IS 'Link to survey table';
COMMENT ON COLUMN survey_event.event_location_id IS 'Link to point_location table';
COMMENT ON COLUMN survey_event.harvester_type_id IS 'Type of harvester counted (rec-clam, tribe-clam, etc.)';
COMMENT ON COLUMN survey_event.harvest_method_id IS 'Type of method used by harvester. Placeholder for non-bivalve fisheries';
COMMENT ON COLUMN survey_event.harvest_gear_type_id IS 'Type of gear used by harvester. Placeholder for non-bivalve fisheries';
COMMENT ON COLUMN survey_event.harvest_depth_range_id IS 'The approximate depth fished. Placeholder for non-bivalve fisheries';
COMMENT ON COLUMN survey_event.event_number IS 'Sequence number for interview or encounter';
COMMENT ON COLUMN survey_event.event_datetime IS 'Time that interview or encounter occurred';
COMMENT ON COLUMN survey_event.harvester_count IS 'Number of harvesters counted';
COMMENT ON COLUMN survey_event.harvest_gear_count IS 'The number of units of gear counted. Placeholder for non-bivalve fisheries';
COMMENT ON COLUMN survey_event.harvester_zip_code IS 'The zip-code of the harvester. Intended for shrimp fisheries';
COMMENT ON COLUMN survey_event.comment_text IS 'Additional comment on survey event';

-- harvester_type_lut
COMMENT ON TABLE public.harvester_type_lut IS 'Categories of harvester type (rec-clam, tribe-clam, etc.)';
COMMENT ON COLUMN harvester_type_lut.harvester_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN harvester_type_lut.harvester_type_code IS 'Code for harvester type';
COMMENT ON COLUMN harvester_type_lut.harvester_type_description IS 'Full description of harvester type';

-- harvest_method_lut
COMMENT ON TABLE public.harvest_method_lut IS 'Categories of harvest method. Intended for non-bivalve fisheries (crab, shrimp)';
COMMENT ON COLUMN harvest_method_lut.harvest_method_id IS 'Universally unique primary key';
COMMENT ON COLUMN harvest_method_lut.harvest_method_code IS 'Code for harvest method';
COMMENT ON COLUMN harvest_method_lut.harvest_method_description IS 'Full description of harvest method';

-- harvest_gear_type_lut
COMMENT ON TABLE public.harvest_gear_type_lut IS 'Categories of harvest gear type. Intended for non-bivalve fisheries (crab, shrimp)';
COMMENT ON COLUMN harvest_gear_type_lut.harvest_gear_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN harvest_gear_type_lut.harvest_gear_type_code IS 'Code for gear type';
COMMENT ON COLUMN harvest_gear_type_lut.gear_type_description IS 'Full description of gear type';

-- harvest_depth_range_lut
COMMENT ON TABLE public.harvest_depth_range_lut IS 'Approximate depth fished. Intended for non-bivalve fisheries (crab, shrimp)';
COMMENT ON COLUMN harvest_depth_range_lut.harvest_depth_range_id IS 'Universally unique primary key';
COMMENT ON COLUMN harvest_depth_range_lut.harvest_depth_range IS 'Depth range';
COMMENT ON COLUMN harvest_depth_range_lut.depth_range_description IS 'Description of depth range';

-- season_type_lut
COMMENT ON TABLE public.season_type_lut IS 'Type of season. Intended for non-bivalve fisheries (crab, shrimp)';
COMMENT ON COLUMN season_type_lut.season_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN season_type_lut.season_type_code IS 'Code for season type';
COMMENT ON COLUMN season_type_lut.season_type_description IS 'Full description of season type';

-- species_encounter
COMMENT ON TABLE public.species_encounter IS 'Data for species encounters';
COMMENT ON COLUMN species_encounter.species_encounter_id IS 'Universally unique primary key';
COMMENT ON COLUMN species_encounter.survey_event_id IS 'Link to survey_event table';
COMMENT ON COLUMN species_encounter.species_id IS 'Species that was encountered';
COMMENT ON COLUMN species_encounter.species_location_id IS 'Link to point_location table';
COMMENT ON COLUMN species_encounter.catch_result_type_id IS 'Was species kept or released';
COMMENT ON COLUMN species_encounter.shell_condition_id IS 'Categories of shell condition (broken, intact, etc.)';
COMMENT ON COLUMN species_encounter.species_count IS 'Number of the species counted';
COMMENT ON COLUMN species_encounter.species_weight_gram IS 'Weight of the species in grams';
COMMENT ON COLUMN species_encounter.no_head_indicator IS 'Intended for shrimp fisheries. Was the head removed?';
COMMENT ON COLUMN species_encounter.comment_text IS 'Additional comment on species encounter';

-- species_lut
COMMENT ON TABLE public.species_lut IS 'List of shellfish species';
COMMENT ON COLUMN species_lut.species_id IS 'Universally unique primary key';
COMMENT ON COLUMN species_lut.taxo_name_id IS 'Link to the WDFW Taxo_Name table';
COMMENT ON COLUMN species_lut.species_code IS 'Short code for species';
COMMENT ON COLUMN species_lut.common_name IS 'Common name of species';
COMMENT ON COLUMN species_lut.genus IS 'The genus name';
COMMENT ON COLUMN species_lut.species IS 'The species name';

-- catch_result_type_lut
COMMENT ON TABLE public.catch_result_type_lut IS 'End result of species encounter (kept, released, etc.)';
COMMENT ON COLUMN catch_result_type_lut.catch_result_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN catch_result_type_lut.catch_result_type_code IS 'Short code for catch result categories';
COMMENT ON COLUMN catch_result_type_lut.catch_result_type_description IS 'Description of catch result categories';

-- shell_condition_lut
COMMENT ON TABLE public.shell_condition_lut IS 'Condition of the shell (broken, unbroken, hardness category, etc.)';
COMMENT ON COLUMN catch_result_type_lut.catch_result_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN catch_result_type_lut.catch_result_type_code IS 'Short code for shell condition categories';
COMMENT ON COLUMN catch_result_type_lut.catch_result_type_description IS 'Description of shell condition categories';

-- individual_species
COMMENT ON TABLE public.individual_species IS 'Data for individual species';
COMMENT ON COLUMN individual_species.individual_species_id IS 'Universally unique primary key';
COMMENT ON COLUMN individual_species.species_encounter_id IS 'Link to species_encounter table';
COMMENT ON COLUMN individual_species.sex_id IS 'Sex of the species. Intended for non-bivalve fisheries';
COMMENT ON COLUMN individual_species.species_sample_number IS 'Unique sample number';
COMMENT ON COLUMN individual_species.weight_measurement_gram IS 'Weight of species in grams';
COMMENT ON COLUMN individual_species.length_measurement_millimeter IS 'Length of species in millimeters';
COMMENT ON COLUMN individual_species.comment_text IS 'Additional comments on individual species';

-- sex_lut
COMMENT ON TABLE public.sex_lut IS 'Sex of species (male, female, unknown, etc). Intended for non-bivalve fisheries';
COMMENT ON COLUMN sex_lut.sex_id IS 'Universally unique primary key';
COMMENT ON COLUMN sex_lut.sex_code IS 'Code for sex categories';
COMMENT ON COLUMN sex_lut.sex_description IS 'Description of sex categories';

-- Estimation section ----------------------------------------------------------------

-- beach_season
COMMENT ON TABLE public.beach_season IS 'Data for open and closed harvest seasons on recreational beaches';
COMMENT ON COLUMN beach_season.beach_season_id IS 'Universally unique primary key';
COMMENT ON COLUMN beach_season.beach_id IS 'Link to beach table';
COMMENT ON COLUMN beach_season.season_status_id IS 'Status of the harvest season (open, closed, etc.)';
COMMENT ON COLUMN beach_season.species_group_id IS 'The group of species the season regulation applies to (clams, oysters, both)';
COMMENT ON COLUMN beach_season.season_start_datetime IS 'Start date of the season';
COMMENT ON COLUMN beach_season.season_end_datetime IS 'End date of the season';
COMMENT ON COLUMN beach_season.season_description IS 'Description of the season designation';
COMMENT ON COLUMN beach_season.comment_text IS 'Additional comments on the season designation';

-- season_status_lut
COMMENT ON TABLE public.season_status_lut IS 'Status of the season designation (open, closed, etc)';
COMMENT ON COLUMN season_status_lut.season_status_id IS 'Universally unique primary key';
COMMENT ON COLUMN season_status_lut.season_status_code IS 'Code for the season status categories';
COMMENT ON COLUMN season_status_lut.season_status_description IS 'Description of the season status categories';

-- species_group_lut
COMMENT ON TABLE public.species_group_lut IS 'The group of species affected by the season regulation (clams, oysters, both)';
COMMENT ON COLUMN species_group_lut.species_group_id IS 'Universally unique primary key';
COMMENT ON COLUMN species_group_lut.species_group_code IS 'Code for the species group categories';
COMMENT ON COLUMN species_group_lut.species_group_description IS 'Description of the species group categories';

-- beach_allowance
COMMENT ON TABLE public.beach_allowance IS 'Harvest quota data for recreational beaches';
COMMENT ON COLUMN beach_allowance.beach_allowance_id IS 'Universally unique primary key';
COMMENT ON COLUMN beach_allowance.beach_id IS 'Link to beach table';
COMMENT ON COLUMN beach_allowance.beach_status_id IS 'Regulatory status of beach (Active, Passive, etc)';
COMMENT ON COLUMN beach_allowance.effort_estimate_type_id IS 'The type of estimate the needs to be reported (Harvester-day, Point, etc)';
COMMENT ON COLUMN beach_allowance.egress_model_type_id IS 'The type of egress model applied to harvester counts (Normal, Early peak, etc)';
COMMENT ON COLUMN beach_allowance.species_group_id IS 'The group of species the quota applies to (clams, oysters, both)';
COMMENT ON COLUMN beach_allowance.report_type_id IS 'The type of report that needs to be generated (External harvest, Internal effort, etc.)';
COMMENT ON COLUMN beach_allowance.harvest_unit_type_id IS 'The type of harvest unit that needs to be reported (Counts, Pounds, etc)';
COMMENT ON COLUMN beach_allowance.allowance_year IS 'The year that the allowed quota applies to';
COMMENT ON COLUMN beach_allowance.allowable_harvest IS 'The allowed quota';
COMMENT ON COLUMN beach_allowance.comment_text IS 'Additional comments on the quota allowance';

-- beach_status_lut
COMMENT ON TABLE public.beach_status_lut IS 'Regulatory status categories (Active, Passive, etc)';
COMMENT ON COLUMN beach_status_lut.beach_status_id IS 'Universally unique primary key';
COMMENT ON COLUMN beach_status_lut.beach_status_code IS 'Code for the beach status categories';
COMMENT ON COLUMN beach_status_lut.beach_status_description IS 'Description of the beach status categories';

-- effort_estimate_type_lut
COMMENT ON TABLE public.effort_estimate_type_lut IS 'Categories of estimate types (Harvester-day, Point count, etc)';
COMMENT ON COLUMN effort_estimate_type_lut.effort_estimate_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN effort_estimate_type_lut.effort_estimate_type_description IS 'Description of the estimate type categories';

-- egress_model_type_lut
COMMENT ON TABLE public.egress_model_type_lut IS 'Categories of egress models used to expand harvester counts (Normal, Early peak, etc)';
COMMENT ON COLUMN egress_model_type_lut.egress_model_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN egress_model_type_lut.egress_model_type_code IS 'Code for the egress model types';
COMMENT ON COLUMN egress_model_type_lut.egress_model_type_description IS 'Description of the egress model categories';

-- report_type_lut
COMMENT ON TABLE public.report_type_lut IS 'Categories of required reporting types (External harvest, Internal effort, etc.)';
COMMENT ON COLUMN report_type_lut.report_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN report_type_lut.report_type_code IS 'Code for the egress model types';
COMMENT ON COLUMN report_type_lut.report_type_description IS 'Description of the egress model categories';

-- harvest_unit_type_lut
COMMENT ON TABLE public.harvest_unit_type_lut IS 'Categories of harvest unit types reported (Counts, Pounds, etc)';
COMMENT ON COLUMN harvest_unit_type_lut.harvest_unit_type_id IS 'Universally unique primary key';
COMMENT ON COLUMN harvest_unit_type_lut.harvest_unit_type_code IS 'Code for the harvest unit types';
COMMENT ON COLUMN harvest_unit_type_lut.harvest_unit_type_description IS 'Description of the harvest unit categories';

-- tide
COMMENT ON TABLE public.tide IS 'Tide data (highs and lows only) for primary Puget Sound reference stations 1970-2056';
COMMENT ON COLUMN tide.tide_id IS 'Universally unique primary key';
COMMENT ON COLUMN tide.tide_strata_id IS 'WDFW intertidal project tide strata used for harvest estimation (HIGH, LOW, etc.)';
COMMENT ON COLUMN tide.tide_station_location_id IS 'Link to the point_location table';
COMMENT ON COLUMN tide.low_tide_datetime IS 'Date and time of the high and low tide';
COMMENT ON COLUMN tide.tide_time_minutes IS 'Time of the tide in minutes from midnight';
COMMENT ON COLUMN tide.tide_height_feet IS 'Height of the tide in feet';

-- tide_strata_lut
COMMENT ON TABLE public.tide_strata_lut IS 'Categories of tide strata used for harvest estimation (HIGH, LOW, etc.)';
COMMENT ON COLUMN tide_strata_lut.tide_strata_id IS 'Universally unique primary key';
COMMENT ON COLUMN tide_strata_lut.tide_strata_code IS 'Code for the tide strata';
COMMENT ON COLUMN tide_strata_lut.tide_strata_description IS 'Description of the tide strata categories';

-- egress_model
COMMENT ON TABLE public.egress_model IS 'Egress model values applied to expand harvester counts';
COMMENT ON COLUMN egress_model.egress_model_id IS 'Universally unique primary key';
COMMENT ON COLUMN egress_model.egress_model_version_id IS 'The version of the model applied';
COMMENT ON COLUMN egress_model.egress_model_interval IS 'Model interval in increments of one minute. Typically 180 minutes either side of low tide';
COMMENT ON COLUMN egress_model.egress_model_ratio IS 'The model ratio used to expand aerial harvester counts';
COMMENT ON COLUMN egress_model.egress_model_variance IS 'The variance of the model';

-- egress_model_version
COMMENT ON TABLE public.egress_model_version IS 'All versions of egress models, current and historical, applied to expand harvester counts.';
COMMENT ON COLUMN egress_model_version.egress_model_version_id IS 'Universally unique primary key';
COMMENT ON COLUMN egress_model_version.egress_model_type_id IS 'Categories of egress models (Normal, Early peak, etc)';
COMMENT ON COLUMN egress_model_version.tide_strata_id IS 'Type of tide strata (HIGH, LOW, etc.)';
COMMENT ON COLUMN egress_model_version.egress_model_name IS 'Name of the egress model';
COMMENT ON COLUMN egress_model_version.egress_model_description IS 'Description of the egress model';
COMMENT ON COLUMN egress_model_version.egress_model_source IS 'Publication or report where egress model was defined';
COMMENT ON COLUMN egress_model_version.inactive_indicator IS 'Has the model been inactivated or superceeded?';
COMMENT ON COLUMN egress_model_version.inactive_datetime IS 'Date when model was inactivated';
COMMENT ON COLUMN egress_model_version.inactive_reason IS 'The reason model was inactivated';
COMMENT ON COLUMN egress_model_version.comment_text IS 'Additional comments on egress model';

-- beach_inventory
COMMENT ON TABLE public.beach_inventory IS 'Placeholder for historical assessments of bivalve resources on public beaches';
COMMENT ON COLUMN beach_inventory.beach_inventory_id IS 'Universally unique primary key';
COMMENT ON COLUMN beach_inventory.beach_id IS 'Link to the beach table';
COMMENT ON COLUMN beach_inventory.survey_type_id IS 'The type of survey conducted (Clam, Oyster, Walkthrough, etc.)';
COMMENT ON COLUMN beach_inventory.species_id IS 'List of shellfish species';
COMMENT ON COLUMN beach_inventory.population_estimate_type IS 'The type of population estimate';
COMMENT ON COLUMN beach_inventory.population_estimate_unit IS 'The unit (count, pounds, etc.) of the estimate';
COMMENT ON COLUMN beach_inventory.survey_completed_datetime IS 'The date the survey was completed?';
COMMENT ON COLUMN beach_inventory.population_estimate IS 'The numeric value of the estimate';
COMMENT ON COLUMN beach_inventory.comment_text IS 'Additional comments on beach inventory';

-- mean_cpue_estimate
COMMENT ON TABLE public.mean_cpue_estimate IS 'Storage table for annual recreational Catch Per Unit Effort (CPUE) estimates';
COMMENT ON COLUMN mean_cpue_estimate.mean_cpue_estimate_id IS 'Universally unique primary key';
COMMENT ON COLUMN mean_cpue_estimate.beach_id IS 'Link to the beach table';
COMMENT ON COLUMN mean_cpue_estimate.beach_number IS 'The Beach Identification Number (BIDN) of the beach';
COMMENT ON COLUMN mean_cpue_estimate.beach_name IS 'Name of the beach';
COMMENT ON COLUMN mean_cpue_estimate.estimation_year IS 'The year for which the estimate was calculated';
COMMENT ON COLUMN mean_cpue_estimate.flight_season IS 'The flight season designation (OO, OC, etc.)';
COMMENT ON COLUMN mean_cpue_estimate.species_code IS 'The species for which the estimate was calculated';
COMMENT ON COLUMN mean_cpue_estimate.survey_count IS 'The number of surveys included in calculation of the mean';
COMMENT ON COLUMN mean_cpue_estimate.mean_cpue IS 'Numeric value of the mean CPUE';

-- mean_effort_estimate
COMMENT ON TABLE public.mean_effort_estimate IS 'Storage table for annual recreational clam and oyster harvest effort estimates';
COMMENT ON COLUMN mean_effort_estimate.mean_effort_estimate_id IS 'Universally unique primary key';
COMMENT ON COLUMN mean_effort_estimate.beach_id IS 'Link to the beach table';
COMMENT ON COLUMN mean_effort_estimate.beach_number IS 'The Beach Identification Number (BIDN) of the beach';
COMMENT ON COLUMN mean_effort_estimate.beach_name IS 'Name of the beach';
COMMENT ON COLUMN mean_effort_estimate.estimation_year IS 'The year for which the estimate was calculated';
COMMENT ON COLUMN mean_effort_estimate.tide_strata IS 'The tide strata for the estimate (ELOW, HIGH, LOW, etc.)';
COMMENT ON COLUMN mean_effort_estimate.flight_season IS 'The flight season designation (OO, OC, etc.)';
COMMENT ON COLUMN mean_effort_estimate.mean_effort IS 'Numeric value of the mean effort';
COMMENT ON COLUMN mean_effort_estimate.tide_count IS 'The number of tide events included in calculation of the mean';


--- STOPPED HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!


