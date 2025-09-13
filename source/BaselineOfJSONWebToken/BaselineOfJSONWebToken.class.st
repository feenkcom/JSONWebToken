Class {
	#name : #BaselineOfJSONWebToken,
	#superclass : #BaselineOf,
	#category : #BaselineOfJSONWebToken
}

{ #category : #baseline }
BaselineOfJSONWebToken >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON:11e274dd96dc9636cab90929937b7cd09719de7c/repository' ].
		spec
			baseline: 'OpenSSL' with: [
				spec repository: 'github://feenkcom/OpenSSL-Pharo:v0.5.130/src-st' ].

		spec package: 'JSONWebToken-Core' with: [
			spec requires: #(#NeoJSON) ].
		spec package: 'JSONWebToken-Core-Tests' with: [
			spec requires: #(#'JSONWebToken-Core') ].
		spec package: 'JSONWebToken-OpenSSL' with: [
			spec requires: #(#'JSONWebToken-Core' #OpenSSL) ].
		spec package: 'JSONWebToken-OpenSSL-Tests' with: [
			spec requires: #(#'JSONWebToken-OpenSSL') ].
	]
]
