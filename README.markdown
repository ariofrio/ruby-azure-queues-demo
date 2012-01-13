# Azure Queues Demo in Ruby

I was going to use rest_client and xmlsimple for this demo, but Azure
authentication is kind of a pain (basically, canonicalize the request, sign
it, and add the signature in the Authentication header). So I used
[waz-storage][] instead (here is their 
[implementation of the authentication scheme][impl]).

  [waz-storage]: https://github.com/johnnyhalife/waz-storage
  [impl]: https://github.com/johnnyhalife/waz-storage/blob/master/lib/waz/storage/core_service.rb

There are similar libraries for Java ([a tutorial][java]) and Python ([winazurestorage][python]).

  [java]: http://msdn.microsoft.com/en-us/library/windowsazure/hh691733(VS.103).aspx
  [python]: https://github.com/sriramk/winazurestorage

The authentication algorithm requires an account name and an access key. To
create an account, log into [the console][], and click on Hosted Services,
Storage Accounts and CDN > Storage Accounts > New Storage Account. To find out
your access key, select your newly created account and the properties panel on
the right should allow you to obtain it. Use the primary key ([here is why][keys]).

  [the console]: http://windows.azure.com/
  [keys]: http://blogs.msdn.com/b/jennifer/archive/2010/03/02/why-do-you-need-a-primary-and-a-secondary-access-key-for-windows-azure-storage.aspx

## Usage

	gem install bundler
	bundle install

	echo AZURE_STORAGE_ACCOUNT_NAME=account-name >> credentials.sh
	echo AZURE_STORAGE_ACCESS_KEY=access-key >> credentials.sh
	. credentials.sh

	bundle exec ruby demo.rb
