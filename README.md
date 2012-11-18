Timeplan
=====

####simplest way to assign delayed tasks and repetitive tasks

---

### Installation

<pre>
  npm install timeplan
</pre>

or

<pre>
  git clone git://github.com/InspiredJW/timeplan.git
</pre>

### Usage

##### Delayed Task

```javascript
timeplan.delayed({
  period: "m"
  task: function() {
    console.log("Every Minutes");
  }
});
```

##### Repetitive Task

```javascript
timeplan.repeat({
  period: "3s"
  task: function() {
    console.log("Every 3 Seconds");
  }
});
```

### Periods

- year : `Y`, `year`, `years`

- month : `M`, `month`, `months`

- week : `W`, `week`, `weeks`

- day : `D`, `day`, `days`

- hour : `h`, `hour`, `hours`

- minute : `m`, `minute`, `minutes`

- second : `s`, `second`, `seconds`
 
