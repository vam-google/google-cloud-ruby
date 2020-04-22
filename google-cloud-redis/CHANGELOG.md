# Release History

### 0.9.0 / 2020-04-22

#### ⚠ BREAKING CHANGES

* **redis:** Convert google-cloud-redis to a wrapper

#### Features

* Convert google-cloud-redis to a wrapper
* Let Bundler.require load the gem without an extra explicit require call.

### 0.8.2 / 2020-04-01

#### Documentation

* Fixed a number of broken links.

### 0.8.1 / 2020-03-26

#### Documentation

* Document Redis 5.0 options

### 0.8.0 / 2020-03-11

#### Features

* Support separate project setting for quota/billing

### 0.7.1 / 2020-02-13

#### Documentation

* Update code samples

### 0.7.0 / 2020-02-10

#### Features

* add CloudRedisClient#upgrade_instance and Instance#connect_mode (ConnectMode)

### 0.6.2 / 2020-01-23

#### Documentation

* Update copyright year
* Update Status documentation

### 0.6.1 / 2019-11-06

#### Bug Fixes

* Update minimum runtime dependencies

### 0.6.0 / 2019-10-29

This release requires Ruby 2.4 or later.

#### Documentation

* Clarify which Google Cloud Platform products support auto-discovered credentials

### 0.5.2 / 2019-10-15

#### Performance Improvements

* Update network configuration

### 0.5.1 / 2019-08-23

#### Documentation

* Update documentation

### 0.5.0 / 2019-07-08

* Support overriding service host and port.

### 0.4.0 / 2019-06-11

* Add #import_instance and #export_instance
* Add Instance#persistence_iam_identity
* Add Instance::State::IMPORTING
* Update documentation to REDIS_4_0 for Instance#redis_version
* Add VERSION constant

### 0.3.0 / 2019-04-29

* Add Instance#persistence_iam_identity attribute.
* Add CloudRedisClient#failover_instance.
* Add ListInstancesResponse#unreachable.
* Add AUTHENTICATION.md guide.
* Update generated documentation for common types.
* Update generated documentation.
* Extract gRPC header values from request.

### 0.2.3 / 2018-09-20

* Update documentation.
  * Change documentation URL to googleapis GitHub org.

### 0.2.2 / 2018-09-12

* Add V1 Client.

### 0.2.1 / 2018-09-10

* Update documentation.

### 0.2.0 / 2018-08-21

* Move Credentials location:
  * Add Google::Cloud::Redis::V1beta1::Credentials
  * Remove Google::Cloud::Redis::Credentials
* Update dependencies.
* Update documentation.

### 0.1.0 / 2018-05-09

This gem contains the Google Cloud Redis service implementation for the `google-cloud` gem.
