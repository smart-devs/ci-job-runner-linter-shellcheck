#!/usr/bin/env bash
HOOK_NAMES="applypatch-msg pre-applypatch post-applypatch pre-commit prepare-commit-msg commit-msg post-commit pre-rebase post-checkout post-merge pre-receive update post-receive post-update pre-auto-gc pre-push"
HOOKS_DIR=$(git rev-parse --show-toplevel)/.git/hooks
for hook in $HOOK_NAMES; do
    if [ ! -h ${HOOKS_DIR}/${hook} ] && [ -f ${HOOKS_DIR}/${hook} ]; then
        mv $HOOKS_DIR/$hook $HOOKS_DIR/$hook.local
	fi
    ln -s -f ../../bin/git/hooks-wrapper.sh ${HOOKS_DIR}/${hook}
done