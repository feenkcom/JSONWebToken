baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON:c09b91c901ec94e74c6fbd55247cce3f3d0d42b0/repository' ].
		spec
			baseline: 'OpenSSL' with: [
				spec repository: 'github://feenkcom/OpenSSL-Pharo:v0.5.129/src-st' ].

		spec package: 'JSONWebToken-Core' with: [
			spec requires: #('NeoJSON') ].
		spec package: 'JSONWebToken-Core-Tests' with: [
			spec requires: #(#'JSONWebToken-Core') ].
		spec package: 'JSONWebToken-OpenSSL' with: [
			spec requires: #(#'JSONWebToken-Core' 'OpenSSL') ].
		spec package: 'JSONWebToken-OpenSSL-Tests' with: [
			spec requires: #('JSONWebToken-OpenSSL') ].
	]