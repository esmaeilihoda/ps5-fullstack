import { Router } from 'express';
import { prisma } from '../lib/prisma.js';

const router = Router();

function toDTO(t) {
  return {
    id: t.id,
    slug: t.slug,
    title: t.title,
    game: t.game,
    description: t.description,
    rules: t.rules,
    startAt: t.startAt,
    entryFee: t.entryFeeCents / 100,
    prizePool: t.prizePoolCents / 100,
    maxPlayers: t.maxPlayers,
    status: t.status,
  };
}

router.get('/', async (_req, res) => {
  const items = await prisma.tournament.findMany({
    where: { status: 'PUBLISHED' },
    orderBy: { startAt: 'asc' },
  });
  
  res.json({ 
    success: true, 
    items: items.map(toDTO) 
  });
});

export default router;