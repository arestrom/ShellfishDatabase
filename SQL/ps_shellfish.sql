-- Edited from shellfish starting on 2022-12-30

-- ToDo:
-- 1. Change to new spatial model
-- 2. Update gid to sequences
-- 3. Add intertidal_area entry to location_type_lut
-- 4. Add Aerial flight route to location_type_lut
-- 5. Add beach to location_type_lut
-- 6. Add management_region to location_type_lut
-- 7. Add shellfish_management_area to location_type_lut

-- Standards: 
-- Dept of Ecology (2927: https://ecology.wa.gov/Research-Data/Data-resources/Geographic-Information-Systems-GIS/Standards)
-- DNR apparently posts in both SPS 2927 and web mercator 3857

-- Create extensions (Query window on database shellfish) -------------------

COMMENT ON DATABASE ps_shellfish
    IS 'Database for Puget Sound Shellfish Unit';
    
--GRANT ALL ON DATABASE ps_shellfish TO stromas;

-- Create tables (Query window on database shellfish) -------------------

CREATE TABLE area_surveyed_lut (
    area_surveyed_id uuid DEFAULT gen_random_uuid() NOT NULL,
    area_surveyed_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY area_surveyed_lut
    ADD CONSTRAINT pk_area_surveyed_lut PRIMARY KEY (area_surveyed_id);

CREATE TABLE catch_result_type_lut (
    catch_result_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    catch_result_type_code text NOT NULL,
    catch_result_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY catch_result_type_lut
    ADD CONSTRAINT pk_catch_result_type_lut PRIMARY KEY (catch_result_type_id);

CREATE TABLE data_review_status_lut (
    data_review_status_id uuid DEFAULT gen_random_uuid() NOT NULL,
    data_review_status_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY data_review_status_lut
    ADD CONSTRAINT pk_data_review_status_lut PRIMARY KEY (data_review_status_id);

CREATE TABLE effort_estimate_type_lut (
    effort_estimate_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    effort_estimate_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY effort_estimate_type_lut
    ADD CONSTRAINT pk_effort_estimate_type_lut PRIMARY KEY (effort_estimate_type_id);
    
CREATE TABLE egress_model (
    egress_model_id uuid DEFAULT gen_random_uuid() NOT NULL,
    egress_model_version_id uuid NOT NULL,
    egress_model_interval integer NOT NULL,
    egress_model_ratio numeric(7,6),
    egress_model_variance numeric(8,7),
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY egress_model
    ADD CONSTRAINT pk_egress_model PRIMARY KEY (egress_model_id);    
    
CREATE TABLE egress_model_type_lut (
    egress_model_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    egress_model_type_code text NOT NULL,
    egress_model_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY egress_model_type_lut
    ADD CONSTRAINT pk_egress_model_type_lut PRIMARY KEY (egress_model_type_id);   

CREATE TABLE egress_model_version (
    egress_model_version_id uuid DEFAULT gen_random_uuid() NOT NULL,
    egress_model_type_id uuid NOT NULL, 
    tide_strata_id uuid NOT NULL,
    egress_model_name text NOT NULL,
    egress_model_description text NOT NULL,
    egress_model_source text,
    inactive_indicator boolean NOT NULL, 
    inactive_datetime timestamptz(6),
    inactive_reason text,
    comment_text text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY egress_model_version
    ADD CONSTRAINT pk_egress_model_version PRIMARY KEY (egress_model_version_id);

CREATE TABLE harvest_depth_range_lut (
    harvest_depth_range_id uuid DEFAULT gen_random_uuid() NOT NULL,
    harvest_depth_range text NOT NULL,
    depth_range_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY harvest_depth_range_lut
    ADD CONSTRAINT pk_harvest_depth_range_lut PRIMARY KEY (harvest_depth_range_id);

CREATE TABLE harvest_gear_type_lut (
    harvest_gear_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    harvest_gear_type_code text NOT NULL,
    gear_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY harvest_gear_type_lut
    ADD CONSTRAINT pk_harvest_gear_type_lut PRIMARY KEY (harvest_gear_type_id);

CREATE TABLE harvest_method_lut (
    harvest_method_id uuid DEFAULT gen_random_uuid() NOT NULL,
    harvest_method_code text NOT NULL,
    harvest_method_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY harvest_method_lut
    ADD CONSTRAINT pk_harvest_method_lut PRIMARY KEY (harvest_method_id);

CREATE TABLE harvest_unit_type_lut (
    harvest_unit_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    harvest_unit_type_code text NOT NULL,
    harvest_unit_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY harvest_unit_type_lut
    ADD CONSTRAINT pk_harvest_unit_type_lut PRIMARY KEY (harvest_unit_type_id);

CREATE TABLE harvester_type_lut (
    harvester_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    harvester_type_code text NOT NULL,
    harvester_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY harvester_type_lut
    ADD CONSTRAINT pk_harvester_type_lut PRIMARY KEY (harvester_type_id);

CREATE TABLE individual_species (
    individual_species_id uuid DEFAULT gen_random_uuid() NOT NULL,
    species_encounter_id uuid NOT NULL,
    sex_id uuid NOT NULL,
    species_sample_number text,
    weight_measurement_gram numeric(8,2),
    length_measurement_millimeter numeric(8,2),
    comment_text text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY individual_species
    ADD CONSTRAINT pk_individual_species PRIMARY KEY (individual_species_id);

CREATE TABLE location (
    location_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_type_id uuid NOT NULL,
    location_code text,
    location_name text,
    location_description text,
    comment_text text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY location
    ADD CONSTRAINT pk_location PRIMARY KEY (location_id);

CREATE TABLE location_coordinates (
    location_coordinates_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    horizontal_accuracy numeric(8,2),
    gid serial unique,
    geog geography(point, 4326) NOT NULL,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY location_coordinates
    ADD CONSTRAINT pk_location_coordinates PRIMARY KEY (location_coordinates_id);

CREATE INDEX location_coordinates_gix ON location_coordinates USING GIST (geog);

CREATE TABLE location_boundary (
    location_boundary_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    boundary_id integer NOT NULL,
    boundary_name text NOT NULL,
    active_datetime timestamptz(6),
    inactive_datetime timestamptz(6),
    inactive_reason text,
    gid serial unique,
    geog geometry(multipolygon, 4326),
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY location_boundary
    ADD CONSTRAINT pk_location_boundary PRIMARY KEY (location_boundary_id);

CREATE INDEX location_boundary_gix ON location_boundary USING GIST (geog);

CREATE TABLE location_route (
    location_route_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    route_id integer NOT NULL,
    route_name text NOT NULL,
    active_datetime timestamptz(6),
    inactive_datetime timestamptz(6),
    inactive_reason text,
    gid serial unique,
    geog geometry(multilinestring, 4326),
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY location_route
    ADD CONSTRAINT pk_location_route PRIMARY KEY (location_route_id);

CREATE INDEX location_route_gix ON location_route USING GIST (geog);

CREATE TABLE location_inventory (
    location_inventory_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    survey_type_id uuid NOT NULL, 
    species_id uuid NOT NULL,
    population_estimate_type uuid NOT NULL,
    population_estimate_unit uuid NOT NULL,
    survey_completed_datetime timestamptz NOT NULL,
    population_estimate integer NOT NULL,
    comment_text character text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY location_inventory
    ADD CONSTRAINT pk_location_inventory PRIMARY KEY (location_inventory_id);

CREATE TABLE location_quota (
    location_quota_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    regulatory_status_id uuid NOT NULL,
    effort_estimate_type_id uuid NOT NULL,
    egress_model_type_id uuid NOT NULL,
    species_group_id uuid NOT NULL,
    report_type_id uuid NOT NULL,
    harvest_unit_type_id uuid,
    quota_year integer NOT NULL,
    allowable_harvest integer,
    comment_text text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY location_quota
    ADD CONSTRAINT pk_location_quota PRIMARY KEY (location_quota_id);

CREATE TABLE location_type_lut (
    location_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY location_type_lut
    ADD CONSTRAINT pk_location_type_lut PRIMARY KEY (location_type_id);

CREATE TABLE media_location (
    media_location_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    media_type_id uuid NOT NULL,
    media_url text NOT NULL,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamp(6) with time zone,
    modified_by text
);

ALTER TABLE ONLY media_location
    ADD CONSTRAINT pk_media_location PRIMARY KEY (media_location_id);

CREATE TABLE media_type_lut (
    media_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    media_type_code text NOT NULL,
    media_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamp(6) with time zone
);

ALTER TABLE ONLY media_type_lut
    ADD CONSTRAINT pk_media_type_lut PRIMARY KEY (media_type_id);

-- Final mean estimate tables for use in projections....These may be temparary

CREATE TABLE mean_effort_estimate (
    mean_effort_estimate_id uuid DEFAULT gen_random_uuid() NOT NULL,
    beach_id uuid NOT NULL,
    beach_number integer NOT NULL,
    beach_name text NOT NULL,
    estimation_year integer NOT NULL,
    tide_strata text NOT NULL,
    flight_season text NOT NULL,
    mean_effort numeric(18,14) NOT NULL,
    tide_count integer NOT NULL,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY mean_effort_estimate
    ADD CONSTRAINT pk_mean_effort_estimate_id PRIMARY KEY (mean_effort_estimate_id);

CREATE TABLE mean_cpue_estimate (
    mean_cpue_estimate_id uuid DEFAULT gen_random_uuid() NOT NULL,
    beach_id uuid NOT NULL,
    beach_number integer NOT NULL,
    beach_name text NOT NULL,
    estimation_year integer NOT NULL,
    flight_season text NOT NULL,
    species_code text NOT NULL,
    survey_count integer NOT NULL,
    mean_cpue numeric(18,14) NOT NULL,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY mean_cpue_estimate
    ADD CONSTRAINT pk_mean_cpue_estimate_id PRIMARY KEY (mean_cpue_estimate_id);

----------------------------------------------------- End

CREATE TABLE mobile_device (
    mobile_device_id uuid DEFAULT gen_random_uuid() NOT NULL,
    mobile_device_type_id uuid NOT NULL,
    mobile_equipment_identifier text NOT NULL,
    mobile_device_name text NOT NULL,
    mobile_device_description text NOT NULL,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY mobile_device
    ADD CONSTRAINT pk_mobile_device PRIMARY KEY (mobile_device_id);

CREATE TABLE mobile_device_type_lut (
    mobile_device_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    mobile_device_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);
    
ALTER TABLE ONLY mobile_device_type_lut
    ADD CONSTRAINT pk_mobile_device_type_lut PRIMARY KEY (mobile_device_type_id);

CREATE TABLE mobile_survey_form (
    mobile_survey_form_id uuid DEFAULT gen_random_uuid() NOT NULL,
    survey_id uuid NOT NULL,
    parent_form_name text,
    parent_form_id text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY mobile_survey_form
    ADD CONSTRAINT pk_mobile_survey_form PRIMARY KEY (mobile_survey_form_id);
    
CREATE TABLE regulatory_status_lut (
    regulatory_status_id uuid DEFAULT gen_random_uuid() NOT NULL,
    status_code text NOT NULL,
    status_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY regulatory_status_lut
    ADD CONSTRAINT pk_regulatory_status_lut PRIMARY KEY (regulatory_status_id);

CREATE TABLE report_type_lut (
    report_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    report_type_code text NOT NULL,
    report_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY report_type_lut
    ADD CONSTRAINT pk_report_type_lut PRIMARY KEY (report_type_id);

CREATE TABLE sampler (
    sampler_id uuid DEFAULT gen_random_uuid() NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    active_indicator boolean NOT NULL,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY sampler
    ADD CONSTRAINT pk_sampler PRIMARY KEY (sampler_id);

CREATE TABLE sampling_program_lut (
    sampling_program_id uuid DEFAULT gen_random_uuid() NOT NULL,
    agency_id uuid NOT NULL,
    sampling_program_code text NOT NULL,
    sampling_program_name text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY sampling_program_lut
   ADD CONSTRAINT pk_sampling_program_lut PRIMARY KEY (sampling_program_id);

CREATE TABLE season (
    season_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    season_status_id uuid NOT NULL,
    species_group_id uuid NOT NULL,
    season_start_datetime timestamptz(6) NOT NULL,
    season_end_datetime timestamptz(6) NOT NULL,
    season_description text,
    comment_text text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY season
    ADD CONSTRAINT pk_season PRIMARY KEY (season_id);

CREATE TABLE season_status_lut (
    season_status_id uuid DEFAULT gen_random_uuid() NOT NULL,
    season_status_code text NOT NULL,
    season_status_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY season_status_lut
    ADD CONSTRAINT pk_season_status_lut PRIMARY KEY (season_status_id);

CREATE TABLE season_type_lut (
    season_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    season_type_code text NOT NULL,
    season_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY season_type_lut
    ADD CONSTRAINT pk_season_type_lut PRIMARY KEY (season_type_id);

CREATE TABLE sex_lut (
    sex_id uuid DEFAULT gen_random_uuid() NOT NULL,
    sex_code text NOT NULL,
    sex_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY sex_lut
    ADD CONSTRAINT pk_sex_lut PRIMARY KEY (sex_id);

CREATE TABLE shell_condition_lut (
    shell_condition_id uuid DEFAULT gen_random_uuid() NOT NULL,
    shell_condition_code text NOT NULL,
    shell_condition_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY shell_condition_lut
    ADD CONSTRAINT pk_shell_condition_lut PRIMARY KEY (shell_condition_id);

CREATE TABLE species_encounter (
    species_encounter_id uuid DEFAULT gen_random_uuid() NOT NULL,
    survey_event_id uuid NOT NULL,
    species_id uuid NOT NULL,
    species_location_id uuid,
    catch_result_type_id uuid NOT NULL,
    shell_condition_id uuid NOT NULL,
    species_count integer NOT NULL,
    species_weight_gram numeric(8,2),
    no_head_indicator boolean NOT NULL, 
    comment_text character text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY species_encounter
    ADD CONSTRAINT pk_species_encounter PRIMARY KEY (species_encounter_id);

CREATE TABLE species_group_lut (
    species_group_id uuid DEFAULT gen_random_uuid() NOT NULL,
    species_group_code text NOT NULL,
    species_group_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY species_group_lut
    ADD CONSTRAINT pk_species_group_lut PRIMARY KEY (species_group_id);

CREATE TABLE species_lut (
    species_id uuid DEFAULT gen_random_uuid() NOT NULL,
    taxo_name_id integer,
    species_code text NOT NULL,
    common_name text NOT NULL,
    genus text,
    species text,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY species_lut
    ADD CONSTRAINT pk_species_lut PRIMARY KEY (species_id);

CREATE TABLE survey (
    survey_id uuid DEFAULT gen_random_uuid() NOT NULL,
    survey_type_id uuid NOT NULL,
    sampling_program_id uuid NOT NULL,
    beach_id uuid,
    point_location_id uuid,
    area_surveyed_id uuid, 
    data_review_status_id uuid NOT NULL,
    survey_completion_status_id uuid NOT NULL,
    survey_datetime timestamptz(6) NOT NULL,
    start_datetime timestamptz(6),
    end_datetime timestamptz(6),
    comment_text text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY survey
    ADD CONSTRAINT pk_survey PRIMARY KEY (survey_id);

CREATE TABLE survey_completion_status_lut (
    survey_completion_status_id uuid DEFAULT gen_random_uuid() NOT NULL,
	  completion_status_description varchar(100) NOT NULL,
	  obsolete_flag boolean NOT NULL,
	  obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY survey_completion_status_lut
    ADD CONSTRAINT pk_survey_completion_status_lut PRIMARY KEY (survey_completion_status_id);

CREATE TABLE survey_event (
    survey_event_id uuid DEFAULT gen_random_uuid() NOT NULL,
    survey_id uuid NOT NULL,
    event_location_id uuid,
    harvester_type_id uuid NOT NULL,
    harvest_method_id uuid NOT NULL,
    harvest_gear_type_id uuid NOT NULL,
    harvest_depth_range_id uuid NOT NULL,
    event_number integer,
    event_datetime timestamptz(6),
    harvester_count integer,
    harvest_gear_count integer,
    harvester_zip_code text,
    comment_text text,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY survey_event
    ADD CONSTRAINT pk_survey_event PRIMARY KEY (survey_event_id);

CREATE TABLE survey_mobile_device (
    survey_mobile_device_id uuid DEFAULT gen_random_uuid() NOT NULL,
    survey_id uuid NOT NULL,
    mobile_device_id uuid NOT NULL
);

ALTER TABLE ONLY survey_mobile_device
    ADD CONSTRAINT pk_survey_mobile_device PRIMARY KEY (survey_mobile_device_id);

CREATE TABLE survey_sampler (
    survey_sampler_id uuid DEFAULT gen_random_uuid() NOT NULL,
    survey_id uuid NOT NULL,
    sampler_id uuid
);

ALTER TABLE ONLY survey_sampler
    ADD CONSTRAINT pk_survey_sampler PRIMARY KEY (survey_sampler_id);

CREATE TABLE survey_type_lut (
    survey_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    survey_type_code text NOT NULL,
    survey_type_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY survey_type_lut
    ADD CONSTRAINT pk_survey_type_lut PRIMARY KEY (survey_type_id);

CREATE TABLE tide (
    tide_id uuid DEFAULT gen_random_uuid() NOT NULL,
    tide_strata_id uuid NOT NULL,
    tide_station_location_id uuid NOT NULL,
    low_tide_datetime timestamptz(6) NOT NULL,
    tide_time_minutes integer NOT NULL,
    tide_height_feet numeric(4,2) NOT NULL,
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY tide
    ADD CONSTRAINT pk_tide PRIMARY KEY (tide_id);

CREATE TABLE tide_correction (
    tide_correction_id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid NOT NULL,
    tide_station_location_id uuid NOT NULL,
    low_tide_correction_minutes integer NOT NULL,
    low_tide_correction_feet numeric(4,2),
    high_tide_correction_minutes integer,
    high_tide_correction_feet numeric(4,2),
    created_datetime timestamp(6) with time zone DEFAULT now() NOT NULL,
    created_by text NOT NULL,
    modified_datetime timestamptz(6),
    modified_by text
);

ALTER TABLE ONLY tide_correction
    ADD CONSTRAINT pk_tide_correction PRIMARY KEY (tide_correction_id);

CREATE TABLE tide_strata_lut (
    tide_strata_id uuid DEFAULT gen_random_uuid() NOT NULL,
    tide_strata_code text NOT NULL,
    tide_strata_description text NOT NULL,
    obsolete_flag boolean NOT NULL,
    obsolete_datetime timestamptz(6)
);

ALTER TABLE ONLY tide_strata_lut
    ADD CONSTRAINT pk_tide_strata_lut PRIMARY KEY (tide_strata_id);

-- Set foreign keys ------------------------------------------------------
    
ALTER TABLE ONLY egress_model
    ADD CONSTRAINT fk_egress_model_version__egress_model FOREIGN KEY (egress_model_version_id) REFERENCES egress_model_version(egress_model_version_id);

ALTER TABLE ONLY egress_model_version
    ADD CONSTRAINT fk_egress_model_type_lut__egress_model_version FOREIGN KEY (egress_model_type_id) REFERENCES egress_model_type_lut(egress_model_type_id);
    
ALTER TABLE ONLY egress_model_version
    ADD CONSTRAINT fk_tide_strata_lut__egress_model_version FOREIGN KEY (tide_strata_id) REFERENCES tide_strata_lut(tide_strata_id);

ALTER TABLE ONLY individual_species
    ADD CONSTRAINT fk_species_encounter__individual_species FOREIGN KEY (species_encounter_id) REFERENCES species_encounter(species_encounter_id);
    
ALTER TABLE ONLY individual_species
    ADD CONSTRAINT fk_sex_lut__individual_species FOREIGN KEY (sex_id) REFERENCES sex_lut(sex_id);

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_location_type_lut__location FOREIGN KEY (location_type_id) REFERENCES location_type_lut(location_type_id);








ALTER TABLE ONLY beach
    ADD CONSTRAINT fk_point_location__beach FOREIGN KEY (tide_station_location_id) REFERENCES point_location(point_location_id);

ALTER TABLE ONLY beach_allowance
    ADD CONSTRAINT fk_beach__beach_allowance FOREIGN KEY (beach_id) REFERENCES beach(beach_id);
    
ALTER TABLE ONLY beach_allowance
    ADD CONSTRAINT fk_beach_status_lut__beach_allowance FOREIGN KEY (beach_status_id) REFERENCES beach_status_lut(beach_status_id);
    
ALTER TABLE ONLY beach_allowance
    ADD CONSTRAINT fk_effort_estimate_type_lut__beach_allowance FOREIGN KEY (effort_estimate_type_id) REFERENCES effort_estimate_type_lut(effort_estimate_type_id);
    
ALTER TABLE ONLY beach_allowance
    ADD CONSTRAINT fk_egress_model_type_lut__beach_allowance FOREIGN KEY (egress_model_type_id) REFERENCES egress_model_type_lut(egress_model_type_id);
    
ALTER TABLE ONLY beach_allowance
    ADD CONSTRAINT fk_species_group_lut__beach_allowance FOREIGN KEY (species_group_id) REFERENCES species_group_lut(species_group_id);
    
ALTER TABLE ONLY beach_allowance
    ADD CONSTRAINT fk_report_type_lut__beach_allowance FOREIGN KEY (report_type_id) REFERENCES report_type_lut(report_type_id);
    
ALTER TABLE ONLY beach_allowance
    ADD CONSTRAINT fk_harvest_unit_type_lut__beach_allowance FOREIGN KEY (harvest_unit_type_id) REFERENCES harvest_unit_type_lut(harvest_unit_type_id);
    
ALTER TABLE ONLY beach_boundary_history
    ADD CONSTRAINT fk_beach__beach_boundary_history FOREIGN KEY (beach_id) REFERENCES beach(beach_id);

ALTER TABLE ONLY beach_boundary_history
    ADD CONSTRAINT fk_survey_type_lut__beach_boundary_history FOREIGN KEY (survey_type_id) REFERENCES survey_type_lut(survey_type_id);
    
ALTER TABLE ONLY beach_intertidal_area
    ADD CONSTRAINT fk_beach__beach_intertidal_area FOREIGN KEY (beach_id) REFERENCES beach(beach_id);
    
ALTER TABLE ONLY beach_inventory
    ADD CONSTRAINT fk_beach__beach_inventory FOREIGN KEY (beach_id) REFERENCES beach(beach_id);
    
ALTER TABLE ONLY beach_inventory
    ADD CONSTRAINT fk_survey_type_lut__beach_inventory FOREIGN KEY (survey_type_id) REFERENCES survey_type_lut(survey_type_id);
    
ALTER TABLE ONLY beach_inventory
    ADD CONSTRAINT fk_species_lut__beach_inventory FOREIGN KEY (species_id) REFERENCES species_lut(species_id);

ALTER TABLE ONLY beach_season
    ADD CONSTRAINT fk_beach__beach_season FOREIGN KEY (beach_id) REFERENCES beach(beach_id);
    
ALTER TABLE ONLY beach_season
    ADD CONSTRAINT fk_season_status_lut__beach_season FOREIGN KEY (season_status_id) REFERENCES season_status_lut(season_status_id);
    
ALTER TABLE ONLY beach_season
    ADD CONSTRAINT fk_species_group_lut__beach_season FOREIGN KEY (species_group_id) REFERENCES species_group_lut(species_group_id);



    
ALTER TABLE ONLY mobile_device
    ADD CONSTRAINT fk_mobile_device_type_lut__mobile_device FOREIGN KEY (mobile_device_type_id) REFERENCES mobile_device_type_lut(mobile_device_type_id);

ALTER TABLE ONLY mobile_survey_form
    ADD CONSTRAINT fk_survey__mobile_survey_form FOREIGN KEY (survey_id) REFERENCES survey(survey_id);
    
ALTER TABLE ONLY point_location
    ADD CONSTRAINT fk_beach__point_location FOREIGN KEY (beach_id) REFERENCES beach(beach_id);



ALTER TABLE ONLY species_encounter
    ADD CONSTRAINT fk_survey_event__species_encounter FOREIGN KEY (survey_event_id) REFERENCES survey_event(survey_event_id);
    
ALTER TABLE ONLY species_encounter
    ADD CONSTRAINT fk_species_lut__species_encounter FOREIGN KEY (species_id) REFERENCES species_lut(species_id);
    
ALTER TABLE ONLY species_encounter
    ADD CONSTRAINT fk_point_location__species_encounter FOREIGN KEY (species_location_id) REFERENCES point_location(point_location_id);
    
ALTER TABLE ONLY species_encounter
    ADD CONSTRAINT fk_catch_result_type_lut__species_encounter FOREIGN KEY (catch_result_type_id) REFERENCES catch_result_type_lut(catch_result_type_id);
    
ALTER TABLE ONLY species_encounter
    ADD CONSTRAINT fk_shell_condition_lut__species_encounter FOREIGN KEY (shell_condition_id) REFERENCES shell_condition_lut(shell_condition_id);

ALTER TABLE ONLY survey
    ADD CONSTRAINT fk_survey_type_lut__survey FOREIGN KEY (survey_type_id) REFERENCES survey_type_lut(survey_type_id);

ALTER TABLE ONLY survey
    ADD CONSTRAINT fk_sampling_program_lut__survey FOREIGN KEY (sampling_program_id) REFERENCES sampling_program_lut(sampling_program_id);

ALTER TABLE ONLY survey
    ADD CONSTRAINT fk_beach__survey FOREIGN KEY (beach_id) REFERENCES beach(beach_id);
    
ALTER TABLE ONLY survey
    ADD CONSTRAINT fk_point_location__survey FOREIGN KEY (point_location_id) REFERENCES point_location(point_location_id);
    
ALTER TABLE ONLY survey
    ADD CONSTRAINT fk_area_surveyed_lut__survey FOREIGN KEY (area_surveyed_id) REFERENCES area_surveyed_lut(area_surveyed_id);

ALTER TABLE ONLY survey
    ADD CONSTRAINT fk_data_review_status_lut__survey FOREIGN KEY (data_review_status_id) REFERENCES data_review_status_lut(data_review_status_id);
    
ALTER TABLE ONLY survey
    ADD CONSTRAINT fk_survey_completion_status_lut__survey FOREIGN KEY (survey_completion_status_id) REFERENCES survey_completion_status_lut(survey_completion_status_id);

ALTER TABLE ONLY survey_event
    ADD CONSTRAINT fk_survey__survey_event FOREIGN KEY (survey_id) REFERENCES survey(survey_id);

ALTER TABLE ONLY survey_event
    ADD CONSTRAINT fk_point_location__survey_event FOREIGN KEY (event_location_id) REFERENCES point_location(point_location_id);
    
ALTER TABLE ONLY survey_event
    ADD CONSTRAINT fk_harvester_type_lut__survey_event FOREIGN KEY (harvester_type_id) REFERENCES harvester_type_lut(harvester_type_id);

ALTER TABLE ONLY survey_event
    ADD CONSTRAINT fk_harvest_method_lut__survey_event FOREIGN KEY (harvest_method_id) REFERENCES harvest_method_lut(harvest_method_id);
    
ALTER TABLE ONLY survey_event
    ADD CONSTRAINT fk_harvest_gear_type_lut__survey_event FOREIGN KEY (harvest_gear_type_id) REFERENCES harvest_gear_type_lut(harvest_gear_type_id);
    
ALTER TABLE ONLY survey_event
    ADD CONSTRAINT fk_harvest_depth_range_lut__survey_event FOREIGN KEY (harvest_depth_range_id) REFERENCES harvest_depth_range_lut(harvest_depth_range_id);

ALTER TABLE ONLY survey_mobile_device
    ADD CONSTRAINT fk_survey__survey_mobile_device FOREIGN KEY (survey_id) REFERENCES survey(survey_id);

ALTER TABLE ONLY survey_mobile_device
    ADD CONSTRAINT fk_mobile_device__survey_mobile_device FOREIGN KEY (mobile_device_id) REFERENCES mobile_device(mobile_device_id);

ALTER TABLE ONLY survey_sampler
    ADD CONSTRAINT fk_survey__survey_sampler FOREIGN KEY (survey_id) REFERENCES survey(survey_id);

ALTER TABLE ONLY survey_sampler
    ADD CONSTRAINT fk_sampler__survey_sampler FOREIGN KEY (sampler_id) REFERENCES sampler(sampler_id);

ALTER TABLE ONLY tide
    ADD CONSTRAINT fk_tide_strata_lut__tide FOREIGN KEY (tide_strata_id) REFERENCES tide_strata_lut(tide_strata_id);
    
ALTER TABLE ONLY tide
    ADD CONSTRAINT fk_point_location__tide FOREIGN KEY (tide_station_location_id) REFERENCES point_location(point_location_id);
    
-- Add normal indexes

-- point_location
CREATE INDEX point_location_beach_idx ON point_location (beach_id);

-- survey
CREATE INDEX survey_beach_idx ON survey (beach_id);
CREATE INDEX survey_point_location_idx ON survey (point_location_id);
CREATE INDEX survey_survey_datetime_idx ON survey ( date(timezone('UTC', survey_datetime)) );

-- mobile_survey_form
CREATE INDEX mobile_survey_form_survey_idx ON mobile_survey_form (survey_id);

-- survey_event
CREATE INDEX survey_event_survey_idx ON survey_event (survey_id);
CREATE INDEX survey_event_event_location_idx ON survey_event (event_location_id);

-- species_encounter
CREATE INDEX species_encounter_survey_event_idx ON species_encounter (survey_event_id);
CREATE INDEX species_encounter_species_location_idx ON species_encounter (species_location_id);

-- individual_species
CREATE INDEX individual_species_species_encounter_idx ON individual_species (species_encounter_id);

-- beach
CREATE INDEX beach_tide_station_location_idx ON beach (tide_station_location_id);

-- beach_allowance
CREATE INDEX beach_allowance_beach_idx ON beach_allowance (beach_id);

-- beach_boundary_history
CREATE INDEX beach_boundary_history_beach_idx ON beach_boundary_history (beach_id);

-- beach_season
CREATE INDEX beach_season_beach_idx ON beach_season (beach_id);

-- Add geometry indexes

CREATE INDEX beach_boundary_history_gix ON beach_boundary_history USING GIST (geom);

CREATE INDEX beach_intertidal_area_gix ON beach_intertidal_area USING GIST (geom);

CREATE INDEX management_region_gix ON management_region_lut USING GIST (geom);

CREATE INDEX point_location_gix ON point_location USING GIST (geom);

CREATE INDEX shellfish_management_area_gix ON shellfish_management_area_lut USING GIST (geom);