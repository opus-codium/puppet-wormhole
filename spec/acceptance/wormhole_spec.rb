# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'wormhole class' do
  it 'works idempotently with no errors' do
    pp = <<~MANIFEST
      class { 'wormhole':
      }
    MANIFEST

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end
end
