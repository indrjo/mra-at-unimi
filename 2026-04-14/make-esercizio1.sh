#!/usr/bin/env bash

print_usage () {
    echo -e "USAGE:\n\t\$ $0 STEPS"
    exit 1
}

[[ -n "$1" ]] || print_usage

N="$1"

for i in $(seq 1 $N); do
    echo "(declare-const pos$i Card)"
    echo "(declare-const how$i Move)"
done

echo
echo "(assert (is-initial-state pos1 how1))"

for i in $(seq 1 $((N-1))); do
    j=$((i+1))
    echo "(assert (transition pos$i how$i pos$j how$j))"
done

echo "(assert (is-final-state pos$N how$N))"

echo
echo "(check-sat)"
echo

for i in $(seq 1 $N); do
    echo "(get-value (how$i))"
    echo "(get-value (pos$i))"
done

