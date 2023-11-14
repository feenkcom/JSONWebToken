baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON:2b0c0d20bc68965c600179f3da16bcace727e8b6/repository' ].
		spec
			baseline: 'OpenSSL' with: [
				spec repository: 'github://feenkcom/OpenSSL-Pharo:v0.5.128/src-st' ].

		spec package: 'JSONWebToken-Core' with: [
			spec requires: #('NeoJSON') ].
		spec package: 'JSONWebToken-Core-Tests' with: [
			spec requires: #(#'JSONWebToken-Core') ].
		spec package: 'JSONWebToken-OpenSSL' with: [
			spec requires: #(#'JSONWebToken-Core' 'OpenSSL') ].
		spec package: 'JSONWebToken-OpenSSL-Tests' with: [
			spec requires: #('JSONWebToken-OpenSSL') ].
	]