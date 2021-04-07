baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON:v17/repository' ];
			baseline: 'OpenSSL' with: [
				spec repository: 'github://feenkcom/OpenSSL-Pharo:v0.5.126/src-st' ].
		spec 
			package: #'JSONWebToken-Core' with: [
				spec requires: #('NeoJSON' ). ];
			package: 'JSONWebToken-Core-Tests' with: [
				spec requires: #(#'JSONWebToken-Core' ). ];
			package: 'JSONWebToken-OpenSSL' with: [
				spec requires: #(#'JSONWebToken-Core' 'OpenSSL' ). ];
			package: 'JSONWebToken-OpenSSL-Tests' with: [
				spec requires: #('JSONWebToken-OpenSSL' ). ]. ].
