features({
    'autoupdater',
    'alfred',
    'config-mode-domain-select',
    'ebtables-filter-multicast',
    'ebtables-filter-ra-dhcp',
    'radv-filterd',
    'ebtables-limit-arp',
    'mesh-batman-adv-15',
    'mesh-vpn-tunneldigger',
    'respondd',
    'status-page',
    'web-advanced',
    'web-wizard',
    'web-osm',
    'config-mode-geo-location-osm',
})

if not device_class('tiny') then
    features({
        'wireless-encryption-wpa3',
    })
end

packages({
    'gluon-autorestart',
    'gluon-ffddorf-watchdog',
    'iwinfo',
})

if not device_class('tiny') then
	features {
		'wireless-encryption-wpa3'
	}
end
