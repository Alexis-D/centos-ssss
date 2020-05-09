## `centos-ssss`

This repo is merely meant to be a convenience wrapper around `ssss` that ensures:

- That a known version of `ssss-combine` can be ran successfully in the future
- That running this version 'just works' (hence wrapping everything into a Docker image)
- That the setup is trivial enough to be debugged easily if anything goes
  wrong (so `make`, single-stage Docker build, etc)

### How to recover a secret?

Ensure you have Docker, `git` and `make` installed, then:

```
git clone https://github.com/Alexis-D/centos-ssss.git
cd centos-ssss

# This will take some time depending on how good/bad your internet connection is;
# this is "installing" everything we need to recover our secret.
make image

# Now we can retrieve the secret, just enter shares one by one.
# Finally you'll see something like:
# Resulting secret: <THE RETRIEVED SECRET>
make run
```

If for some reason the default the default `make run` doesn't work for
you (e.g. different number of shares), then:

```
# Current version is v0.5.6
# T is the minimum # of shares needed to reconstruct the secret
docker run -it --rm centos-ssss:$VERSION /usr/bin/ssss-combine -t $T
```

Relevant links:

- [Shamir's Secret Sharing Scheme](http://point-at-infinity.org/ssss/)
- [`ssss`'s man page](http://point-at-infinity.org/ssss/ssss.1.html)
- [MrJoy/ssss](https://github.com/MrJoy/ssss) (the fork of the aforementioned
  project we're using here, technically we use a [fork of this fork](https://github.com/alexis-d/ssss),
  this is merely in case the original repo ever disappears)
- [Shamir's Secret Sharing on Wikipedia](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing)
