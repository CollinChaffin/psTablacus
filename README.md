*psTablacus*: Powershell module to install or update one or more instance(s) of Tablacus.
===================================================================
###### by Collin Chaffin  
[![Twitter Follow](https://img.shields.io/twitter/follow/collinchaffin.svg?style=social)](https://twitter.com/collinchaffin)

[![Development Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)](https://raw.githubusercontent.com/CollinChaffin/psTablacus/master/README.md)[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/CollinChaffin/psTablacus/master/LICENSE)[![GitHub stars](https://img.shields.io/github/stars/collinchaffin/psTablacus)](https://github.com/CollinChaffin/psTablacus/stargazers)[![GitHub forks](https://img.shields.io/github/forks/collinchaffin/psTablacus)](https://github.com/CollinChaffin/psTablacus/network)[![GitHub issues](https://img.shields.io/github/issues/collinchaffin/psTablacus)](https://github.com/CollinChaffin/psTablacus/issues)


Description:
------------

This module is designed to install or update one or more instance(s) of Tablacus.

A bit of background for those not familiar with Tablacus: After 3+ decades of starting with the original progman in the very first version of Windows I can honestly say that it, in my opinion, is by far, hands-down, the BEST Windows Explorer replacement.  The level of customization literally dwarfs every other Explorer replacement I have tested and it is totally open-source with an founder/author that has added several fairly earth-shattering features I have personally requested that MS should really have long-since added to Explorer.

Since it is fully portable and uses config files in it's local instance (actually a good thing for a number of reasons), there are unfortunately no easy methods via registry or appdata to locate existing instance(s).

So even though it does have an auto-update add-on, if you have multiple instances (think network shares, etc.) with separate configs, today the method to update them all would be to open each instance's GUI to update or manually (or via custom script) downloading and unzipping to targets.  But, you would also have to deal with detection of in-use instance(s).

That is where this module fills in the gap and can perform the detection, skip those in use, and handing all downloading and updating of one or many instances.

> ### NOTE
> ***
> 
> 
> I am not the author of Tablacus just a contributor. Please contact Gaku for anything related to Tablacus
> 
> Github:   https://github.com/tablacus/TablacusExplorer  
> 
> Website:  https://tablacus.github.io/explorer_en.html
> 
> ***



Prerequisites:
--------------

The `Install-Tablacus` function will test all open processes against the one or more install/upgrade paths to determine if any requested instance(s) are running.  Any running instances will simply be skipped and warn you of the skip action.


# Installation Instructions

Install via the PSGallery via:
	
```
Install-Module psTablacus -AllowPrerelease -Scope AllUsers
```



Examples:
---------

Open Windows Powershell and execute:

```
Import-Module psTablacus
```

To install or update a single instance of TE:

```
PS C:\> Install-Tablacus -Instance 'C:\Portable\Tablacus'
```

To install or update a multiple instances of TE (where Tablacus02 in this example is a fresh install):

```
PS C:\> Install-Tablacus -Instance 'C:\Portable\Tablacus01','C:\Portable\Tablacus02'
```
  

Changelog:
-------------

| Version | Release Date    |    Description                           |
|---------|-----------------|------------------------------------------|
| v1.0.0.1 | 09-06-2019	| Initial release |



TODO:
-------------

No immediate TODOs but please submit PRs or requests via GH issue and I will update accordingly.


LICENSE:
-------------
Please see the included LICENSE file.  
  
_THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE._  



__Collin Chaffin__  
[![Twitter Follow](https://img.shields.io/twitter/follow/collinchaffin.svg?style=social)](https://twitter.com/collinchaffin)



Donations:
-----------------------------

You can support my efforts and every donation is greatly appreciated!  
<a href="https://paypal.me/CollinChaffin"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" alt="[paypal]" /></a>  

