baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON:f54cfb4a931971ed356d1dfde0e135951e82daae/repository' ].
		spec
			baseline: 'OpenSSL' with: [
				spec repository: 'github://feenkcom/OpenSSL-Pharo:v0.5.129/src-st' ].

		spec package: 'JSONWebToken-Core' with: [
			spec requires: #(#NeoJSON) ].
		spec package: 'JSONWebToken-Core-Tests' with: [
			spec requires: #(#'JSONWebToken-Core') ].
		spec package: 'JSONWebToken-OpenSSL' with: [
			spec requires: #(#'JSONWebToken-Core' #OpenSSL) ].
		spec package: 'JSONWebToken-OpenSSL-Tests' with: [
			spec requires: #(#'JSONWebToken-OpenSSL') ].
	]