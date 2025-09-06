// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract RareCoin {
    string public name;
    string public symbol;
    uint256 decimals;
    uint256 public totalSupply;
    address public SkillCoin;

    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    // event approve(address indexed from, address indexed _spender, uint256 _amount);

    constructor (address _SkillCoin){
        name = "RareCoin";
        symbol = "RC";
        decimals = 18;
        SkillCoin = _SkillCoin ;
    }

    function balanceOf(address account) public view returns(uint256) {
        return balances[account];
    }

    function transfer (address _to, uint256 _amount) public returns (bool) {
        require (balanceOf(msg.sender) > _amount, "not enough eth");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function approve (address _spender,uint256 _amount) public returns (bool){
        allowances[msg.sender][_spender] = _amount;
        //emit approve(msg.sender,_spender, _amount);
        return true;
    } 

    function allowance(address owner, address _spender) public view returns(uint256){
        return allowances[owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
        require(allowance(_from, _to) >= _value, "not enough allowance");
        require(balances[_from] >= _value,"not enough balance");
        balances[_from] -= _value;
        balances[_to] += _value;
        allowances[_from][_to] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function mint (uint256 amount) public {
        totalSupply += amount;
        balances[msg.sender] += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function trade (uint256 amount) public {
        require (amount > 0, "amount must be greater than 0");
        bool result = IERC20(SkillCoin).transferFrom(msg.sender, address(this), amount);
        require ( result , "transferFrom Failed");
        totalSupply += amount;
        balances[msg.sender] += amount;
        emit Transfer(address(0), msg.sender, amount);

    }

}
