pragma solidity ^0.4.17;

contract Agreement {

    // Builder
    struct Owner {
        string ownerId;
        address ownerAccount;
    }

    // Information about the flat
    struct Flat {
        uint roomNo;
        uint blockNo;
        string area;
        string city;
        uint securityDeposit;
        uint rent;
    }

    // Information about the tenant
    struct Tenant {
        string name;
        address tenantAccount;
    }

    Owner public owner;
    Flat public flat;
    Tenant public tenant;
    bool public isSecurityDepositSubmitted;
    uint public startedDate;
    uint public endDate;
    bool public isFinished;
    uint uptoRentSubmitted;

    modifier restrictedForBuilder() {
        require(owner.ownerAccount == msg.sender);
        _;
    }

    modifier restrictedForTenant() {
        require(tenant.tenantAccount == msg.sender);
        _;
    }

    function Agreement (string _ownerId, address _ownerAccount, uint _roomNo, uint _blockNo, string _area, string _city, uint _securityDeposit, uint _rent, string _name,address _tenantAccount, uint _endDate) public {
        Owner memory ownerTemp = Owner({
            ownerId: _ownerId,
            ownerAccount: _ownerAccount
        });

        Flat memory flatTemp = Flat({
            roomNo: _roomNo,
            blockNo: _blockNo,
            area: _area,
            city: _city,
            securityDeposit: _securityDeposit,
            rent: _rent
        });

        Tenant memory tenantTemp = Tenant({
            name: _name,
            tenantAccount: _tenantAccount
        });

        owner = ownerTemp;
        flat = flatTemp;
        tenant = tenantTemp;
        isSecurityDepositSubmitted = false;
        startedDate = block.timestamp;
        endDate = _endDate;
        isFinished = false;
        uptoRentSubmitted = block.timestamp;
    }

    function paySecurityDeposit() public payable restrictedForTenant {
        require(flat.securityDeposit == msg.value);
        isSecurityDepositSubmitted = true;
    }

    function payRent(uint nextMonth) public payable restrictedForTenant {
        require(endDate > nextMonth);
        require(flat.rent == msg.value);
        owner.ownerAccount.transfer(msg.value);
        uptoRentSubmitted = nextMonth;
    }

    // Forceful
    function endAgreement() public payable restrictedForBuilder {
        owner.ownerAccount.transfer(address(this).balance);
        isFinished = true;
    }

    // Peaceful
    function finishAgreement() public payable restrictedForBuilder {
        require(endDate < block.timestamp);
        tenant.tenantAccount.transfer(address(this).balance);
        isFinished = true;
    }

    function getStatus() public view returns (uint) {
        return uptoRentSubmitted;
    }

}

