read -p "Are you sure? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	exit 1
fi

rm -r persist/html/*
rm -r persist/mysql/*
rm persist/ssl/certs/*
rm persist/ssl/private/*
